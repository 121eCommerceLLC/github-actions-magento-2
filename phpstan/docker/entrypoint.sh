#!/bin/sh -l

cd ${GITHUB_WORKSPACE}

test -z "${PATH_TO_CODE}" && PATH_TO_CODE=$INPUT_PATH_TO_CODE
test -z "${LEVEL}" && LEVEL=$INPUT_LEVEL
test -z "${SETUP_DI_COMPILE}" && SETUP_DI_COMPILE=$INPUT_SETUP_DI_COMPILE

test -z "${PATH_TO_CODE}" && PATH_TO_CODE=/
test -z "${LEVEL}" && LEVEL=1
test -z "${SETUP_DI_COMPILE}" && SETUP_DI_COMPILE=1

echo "Path to Code: ${PATH_TO_CODE}"
echo "PHPStan Level: ${LEVEL}"
echo "Run Command \"bin/magento setup:di:compile\": ${SETUP_DI_COMPILE}"

echo "Run \"composer install\""
sh -c "composer require --dev phpstan/phpstan --no-install --no-interaction"
sh -c "composer require --dev bitexpert/phpstan-magento --no-install --no-interaction"
sh -c "composer require --dev phpstan/extension-installer --no-install --no-interaction"
sh -c "composer config --no-plugins allow-plugins.phpstan/extension-installer true"
sh -c "composer install --ignore-platform-reqs --no-interaction --no-progress"

if ! test -z "${SETUP_DI_COMPILE}"
then
    echo "Run \"./bin/magento setup:di:compile\""
    sh -c "./bin/magento setup:di:compile"
    sh -c "composer dump-autoload -o --apcu"
fi

echo "Run \"./vendor/bin/phpstan analyse ${GITHUB_WORKSPACE}${PATH_TO_CODE} \
       --level ${LEVEL} \
       --error-format=github \
       --configuration ${GITHUB_WORKSPACE}/dev/tests/static/testsuite/Magento/Test/Php/_files/phpstan/phpstan.neon \
       --no-progress\""

sh -c "./vendor/bin/phpstan analyse ${GITHUB_WORKSPACE}${PATH_TO_CODE} \
  --level ${LEVEL} \
  --error-format=github \
  --configuration ${GITHUB_WORKSPACE}/dev/tests/static/testsuite/Magento/Test/Php/_files/phpstan/phpstan.neon \
  --no-progress"
