FROM php:7.4-cli-alpine

COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer

RUN /usr/local/bin/composer global require phpcompatibility/php-compatibility:10.x-dev
RUN ~/.composer/vendor/bin/phpcs --config-set installed_paths ../../phpcompatibility/php-compatibility
RUN echo memory_limit = -1 >> /usr/local/etc/php/conf.d/custom-memory.ini

ADD problem-matcher.json /problem-matcher.json
ADD ruleset.xml /ruleset.xml
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
