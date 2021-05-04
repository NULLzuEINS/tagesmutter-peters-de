FROM webdevops/php-nginx:7.4

LABEL com.centurylinklabs.watchtower.enable="true"
LABEL Maintainer="André Lademann <andre@nullzueins.com>" \
      Description="Website."

COPY --chown=application ./app /app

ENV WEB_DOCUMENT_INDEX=index.html

# COPY ./rootfs /
# Make sure files/folders needed by the processes are accessable when they run under the nobody user
#RUN chown -R nobody.nobody /var/lib/nginx && \
#    chown -R nobody.nobody /var/tmp/nginx && \
#    chown -R nobody.nobody /var/log/nginx#

# Switch to use a non-root user from here on
#WORKDIR /var/www/html
#USER nobody
#COPY --chown=nobody ./app /var/www/html/

# Configure a healthcheck to validate that everything is up&running
HEALTHCHECK --timeout=10s CMD curl --silent --fail http://127.0.0.1:80/fpm-ping
