# tagesmutter-peters.de - Generated static page

## Build

```bash
docker login
docker build -t vergissberlin/tagesmutter-peters-de .
```

## Watchtower

```bash
docker login
docker-compose -f config/watchtower/docker-compose.watchdog.yml up -d
```

## Deploy

```bash
scp -r ./app nze:/var/docker/tagesmutter-peters-de/app
```
