# tagesmutter-peters.de - Generated static page

This is a private website.

## Build and push

```bash
docker login docker.pkg.github.com --username vergissberlin
docker build -t docker.pkg.github.com/vergissberlin/tagesmutter-peters-de/app .
docker push docker.pkg.github.com/vergissberlin/tagesmutter-peters-de/app
```

## Watchtower

```bash
docker login
docker-compose -f config/watchtower/docker-compose.watchdog.yml up -d
```

## Deploy

### Downsync

```bash
scp -r nze:/var/docker/tagesmutter-peters.de/www/app .
```

### Upsync

```bash
scp -r ./app nze:/var/docker/tagesmutter-peters.de/www/app
```

## Development

### Configure

```bash
cp .env.dist .env
vim .env
```

### Starting

```bash
docker-compose up -d
```

### Debuging

```bash
docker-compose logs -f
```

### Compile

```bash
npm i -g less less-watch-compiler
less-watch-compiler --minified --source-map --main-file styles.less  app/less/ app/css/
```

### Stoping

```bash
docker-compose down -v
```
