#!/bin/sh -l

cd ${GITHUB_WORKSPACE}

test -z "${PATH_TO_CODE}" && PATH_TO_CODE=$INPUT_PATH_TO_CODE

test -z "${PATH_TO_CODE}" && PATH_TO_CODE=/

echo "PHPMD path to code: ${PATH_TO_CODE}"

sh -c "/root/.composer/vendor/bin/phpmd ${GITHUB_WORKSPACE}${PATH_TO_CODE} github /ruleset.xml --suffixes php,phtml"
