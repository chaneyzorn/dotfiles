# WebDAV in Docker Compose

A standalone WebDAV server based on [hacdias/webdav](https://github.com/hacdias/webdav).

## Files

- `docker-compose.yaml` — WebDAV container definition.
- `webdav-config.yml` — Server configuration. Credentials are read from `.env`.
- `.env.example` — Template for environment variables.
- `.env` — Real credentials. **Ignored by git.**

## Usage

```sh
cd /path/to/webdav
cp .env.example .env
# Edit .env and set a strong password.
docker compose up -d
```

The server listens on port `6065` and is exposed through Caddy at
`https://webdav.home.lan`.

## Data directory

This stack mounts the Syncthing data directory
(`../syncthing/SyncMeta`) into the WebDAV container at `/data`. That makes all
Syncthing-synced folders accessible through WebDAV.

## Reverse proxy notes

WebDAV `COPY` and `MOVE` requests include a `Destination` header with the full
URL. The Caddy configuration rewrites this header to contain only the path,
which is required for these methods to work behind the reverse proxy.

## References

- [hacdias/webdav GitHub](https://github.com/hacdias/webdav)
