#!/bin/sh -l

cd ${GITHUB_WORKSPACE}

test -z "${PATH_TO_CODE}" && PATH_TO_CODE=$INPUT_PATH_TO_CODE

test -z "${PATH_TO_CODE}" && PATH_TO_CODE=/

echo "PHPMD path to code: ${PATH_TO_CODE}"

echo "Run \"./vendor/bin/phpmd ${GITHUB_WORKSPACE}${PATH_TO_CODE} github \
 ./dev/tests/static/testsuite/Magento/Test/Php/_files/phpmd/ruleset.xml \
 --suffixes php,phtml\""

sh -c "./vendor/bin/phpmd ${GITHUB_WORKSPACE}${PATH_TO_CODE} github \
 ./dev/tests/static/testsuite/Magento/Test/Php/_files/phpmd/ruleset.xml \
 --suffixes php,phtml"
