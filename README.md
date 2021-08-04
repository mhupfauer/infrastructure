# Docker configuration for Vaultwarden, paperless-ng and pi-hole behind traefik

## Setup
1. host domain on cloudflare and retrieve global api token
1. copy `*.env.sample` to `*.env`
1. edit `*.env` files according to your whishes (insert cloudflare api tokens into traefik.env!)
1. edit docker-compose.yml. replace domain rules to your wishes
1. `docker-compose run --rm webserver createsuperuser` configure your user
1. `docker-compose up -d`
1. wait at least 2 minutes (on slow hardware longer check `docker-compose logs`)
1. `docker-compose down`
1. edit `apps.d/pihole/etc-pihole/custom.list` [example: 10.0.1.2 dns.domain.tld] where as 10.0.1.2 is the ip of the docker host. You must do this for pi-hole, vaultwarden and paperless-ng domains
1. edit images/brother_scan/Dockerfile to point to your printers IP and change the model number
1. docker-compose up -d
1. ./consume start

## Usage
Start
```bash
docker-compose up -d
./consume.sh start
```

Stop
```bash
docker-compose down
./consume.sh stop
```


