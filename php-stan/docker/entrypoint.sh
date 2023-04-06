#!/bin/sh -l

cd ${GITHUB_WORKSPACE}

test -z "${PATH_TO_CODE}" && PATH_TO_CODE=$INPUT_PATH_TO_CODE
test -z "${LEVEL}" && LEVEL=$INPUT_LEVEL

test -z "${PATH_TO_CODE}" && PATH_TO_CODE=/
test -z "${LEVEL}" && LEVEL=1

echo "PhpStan path to code: ${PATH_TO_CODE}"
echo "PhpStan level: ${LEVEL}"

sh -c "composer --version"
sh -c "/usr/local/bin/composer --version"

echo "/root/.composer/vendor/bin/phpstan analyse ${GITHUB_WORKSPACE}${PATH_TO_CODE} --level ${LEVEL} --error-format=github"

sh -c "/root/.composer/vendor/bin/phpstan analyse ${GITHUB_WORKSPACE}${PATH_TO_CODE} --level ${LEVEL} --error-format=github"
