ACTION ?= up -d

kong-postgres:
	COMPOSE_PROJECT_NAME=kong \
	COMPOSE_PROFILES=database \
	KONG_DATABASE=postgres \
	KONG_PROXY_LISTEN="0.0.0.0:8000, 0.0.0.0:8443 ssl" \
	KONG_ADMIN_LISTEN="0.0.0.0:8001 reuseport backlog=16384, 0.0.0.0:8444 http2 ssl reuseport backlog=16384" \
	KONG_ADMIN_GUI_LISTEN="0.0.0.0:8002, 0.0.0.0:8445 ssl" \
	docker compose ${ACTION}

kong-dbless:
	docker compose up -d

clean:
	docker compose kill
	docker compose rm -f
