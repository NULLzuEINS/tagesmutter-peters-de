FROM vergissberlin/hugo as build
LABEL com.centurylinklabs.watchtower.enable="false"

WORKDIR /app
COPY ./ /app
RUN hugo

FROM nginx:alpine
LABEL maintainer André Lademann <vergissberlin@googlemail.com>
LABEL com.centurylinklabs.watchtower.enable="true"

WORKDIR /var/www/html
COPY ./config/nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app /var/www/html
