# Proxy

Basic traefik configuration for proxying requests to any docker-compose setup.

### Setup

`make up`

### Debug

`make debug`

> it will run traefik with UI

### Usage

Simply add next label and network to your web container:

```yaml
    networks:
      - ...
      - traefik

    labels:
      - "traefik.enable=true"
      - "traefik.docker.network=traefik"
      - "traefik.http.routers.project-name.rule=Host(`${HOST}`)"
      - "traefik.http.services.project-name.loadbalancer.server.port=3000"
networks:
    # ...your networks...
    traefik:
      name: "traefik"
      external: true
```

> Pay attention:

- **server.port=3000** is internal port of service in the container
- **HOST** is _env_ variable, don't forget to set up it, e.g. _subdomain.domain.com_
