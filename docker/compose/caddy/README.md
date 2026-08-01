# Caddy in Docker Compose

A lightweight replacement for the existing `docker-kong` stack, migrated from
Kong's live Services/Routes configuration.

## Why Caddy instead of Kong here?

- **No database required**: the current Kong setup depends on PostgreSQL,
  migrations, and three Kong-related containers. Caddy uses a single container
  with a static Caddyfile.
- **Simpler for basic reverse proxying**: the live Kong config only uses Gateway
  Services and host-based Routes with no plugins. Caddy covers this with
  `reverse_proxy` and site blocks.
- **Automatic HTTPS** (optional): Caddy can manage LAN/internal certificates
  automatically, or re-use an existing wildcard certificate.

## Migrated mapping

The base domain is controlled by the `DOMAIN` environment variable. The example
below assumes `DOMAIN=home.lan`.

| Hostname | Upstream env var | Example upstream |
|----------|------------------|------------------|
| `adguard.{$DOMAIN}` | `ADGUARD_UPSTREAM` | `192.0.2.10:15353` |
| `beszel.{$DOMAIN}` | `BESZEL_UPSTREAM` | `192.0.2.10:8090` |
| `dufs.{$DOMAIN}`, `dufs.wk1.{$DOMAIN}` | `DUFS_UPSTREAM` | `192.0.2.10:5000` |
| `gitea.{$DOMAIN}` | `GITEA_UPSTREAM` | `192.0.2.10:3280` |
| `homarr.{$DOMAIN}` | `HOMARR_UPSTREAM` | `192.0.2.10:7575` |
| `kong.{$DOMAIN}` | `KONG_MANAGER_UPSTREAM` | `https://192.0.2.10:8445` |
| `kuma.{$DOMAIN}` | `KUMA_UPSTREAM` | `192.0.2.10:13001` |
| `metacube.{$DOMAIN}` | `METACUBE_UPSTREAM` | `192.0.2.10:17895` |
| `portainer.{$DOMAIN}` | `PORTAINER_UPSTREAM` | `https://192.0.2.10:9443` |
| `pve.{$DOMAIN}` | `PVE_UPSTREAM` | `https://192.0.2.11:8006` |
| `syncthing.{$DOMAIN}`, `syncthing.wk1.{$DOMAIN}` | `SYNCTHING_UPSTREAM` | `https://192.0.2.10:8384` |
| `timecrack.{$DOMAIN}` | `TIMECRACK_UPSTREAM` | `192.0.2.12:5173` |
| `wifi.{$DOMAIN}` | `WIFI_ROUTER_UPSTREAM` | `192.0.2.1:80` |

## What is *not* directly equivalent?

Kong plugins (authentication, rate limiting, OAuth, request/response transforms,
etc.) do not have one-to-one Caddy directives. The live config had **no plugins
configured**, so this is a safe migration.

## Files

- `docker-compose.yaml` — single Caddy service with persistent `/data` and
  `/config` volumes.
- `Caddyfile` — migrated Services/Routes mapped to Caddy site blocks. Domain and
  upstream addresses are injected through environment variables.
- `.env.example` — template with example values. **Committed to git.**
- `.env` — real values. **Ignored by git.**
- `config/caddy_data/.gitkeep`, `config/caddy_config/.gitkeep`,
  `config/certs/.gitkeep` — keep the runtime / certificate directories in git so
  they exist after cloning.

## Usage

```sh
# 1. Prepare the local environment file (only needed once)
cd /path/to/caddy
cp .env.example .env
# Edit .env to set DOMAIN and real upstream addresses.

# 2. Stop the existing Kong stack to free ports 80/443
cd /path/to/docker-kong
make clean        # or: docker compose down

# 3. Start Caddy
cd /path/to/caddy
docker compose up -d

# 4. Validate / reload the Caddyfile without restarting
docker exec caddy caddy validate --config /etc/caddy/Caddyfile
docker exec caddy caddy reload --config /etc/caddy/Caddyfile
```

## TLS options

The Caddyfile currently uses Caddy's internal CA (`local_certs`). Browsers will
warn until you trust Caddy's root certificate.

Other options are commented in `Caddyfile`:

1. **Existing wildcard certificate** — copy the certificate and key into
   `config/certs/`, uncomment the `config/certs` volume in `docker-compose.yaml`,
   and add per-site `tls` directives in `Caddyfile`.
2. **Plain HTTP only** — change the global option to `auto_https off`.

## Rollback

If anything breaks, stop Caddy and start Kong again:

```sh
cd /path/to/caddy
docker compose down
cd /path/to/docker-kong
make kong-postgres ACTION=up -d
```
