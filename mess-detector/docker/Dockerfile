FROM php:7.4-cli-alpine

COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer

RUN /usr/local/bin/composer global require phpmd/phpmd:*
RUN echo memory_limit = -1 >> /usr/local/etc/php/conf.d/custom-memory.ini

ADD ruleset.xml /ruleset.xml
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
