#!/bin/sh -l

# Copy the matcher to a shared volume with the host;
# otherwise "add-matcher" can't find it.
cp /problem-matcher.json ${HOME}/
echo "::add-matcher::${HOME}/problem-matcher.json"

cd $GITHUB_WORKSPACE

test -z "${PHPCS_REPORT}" && PHPCS_REPORT=$INPUT_PHPCS_REPORT
test -z "${PHPCS_EXTENSIONS}" && PHPCS_EXTENSIONS=$INPUT_PHPCS_EXTENSIONS
test -z "${PATH_TO_CODE}" && PATH_TO_CODE=$INPUT_PATH_TO_CODE
test -z "${TEST_VERSIONS}" && TEST_VERSIONS=$INPUT_TEST_VERSIONS

test -z "${PHPCS_REPORT}" && PHPCS_REPORT=checkstyle
test -z "${PHPCS_EXTENSIONS}" && PHPCS_EXTENSIONS=php,phtml
test -z "${PATH_TO_CODE}" && PATH_TO_CODE=/
test -z "${TEST_VERSIONS}" && TEST_VERSIONS=7.4-

echo "PHPCS path to code: ${PATH_TO_CODE}"
echo "PHPCS full path to code 1: $GITHUB_WORKSPACE${PATH_TO_CODE}"
echo "PHPCS full path to code 2: ${GITHUB_WORKSPACE}${PATH_TO_CODE}"
echo "PHPCS report: ${PHPCS_REPORT}"
echo "PHPCS extensions: ${PHPCS_EXTENSIONS}"
echo "PHPCS test versions: ${TEST_VERSIONS}"

sh -c "/root/.composer/vendor/bin/phpcs \
  --report=${PHPCS_REPORT} \
  --extensions=${PHPCS_EXTENSIONS} \
  --standard=/ruleset.xml --runtime-set testVersion ${TEST_VERSIONS} \
  $GITHUB_WORKSPACE${PATH_TO_CODE} \
  -s $*"
