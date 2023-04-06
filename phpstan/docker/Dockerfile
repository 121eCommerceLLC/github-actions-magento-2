FROM php:7.4-cli-alpine

COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer

RUN /usr/local/bin/composer global require phpstan/phpstan:*
RUN /usr/local/bin/composer global require bitexpert/phpstan-magento:*
RUN /usr/local/bin/composer global require phpstan/extension-installer:*
RUN /usr/local/bin/composer global config allow-plugins.phpstan/extension-installer true

RUN echo memory_limit = -1 >> /usr/local/etc/php/conf.d/custom-memory.ini

#ADD problem-matcher.json /problem-matcher.json
#ADD ruleset.xml /ruleset.xml
#ADD extensions-override.xml /extensions-override.xml
#ADD MEQP2 /MEQP2
#ADD PHP_CodeSniffer /PHP_CodeSniffer
#ADD bootstrap.php /bootstrap.php

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
