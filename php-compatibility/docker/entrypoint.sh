#!/bin/sh -l

# Copy the matcher to a shared volume with the host; otherwise "add-matcher"
# can't find it.
cp /problem-matcher.json ${HOME}/
echo "::add-matcher::${HOME}/problem-matcher.json"

cd $GITHUB_WORKSPACE

test -z "${PHPCS_REPORT}" && PHPCS_REPORT=$INPUT_PHPCS_REPORT
test -z "${PHPCS_EXTENSIONS}" && PHPCS_EXTENSIONS=$INPUT_PHPCS_EXTENSIONS
test -z "${TEST_VERSIONS}" && TEST_VERSIONS=$INPUT_TEST_VERSIONS

test -z "${PHPCS_REPORT}" && PHPCS_REPORT=checkstyle
test -z "${TEST_VERSIONS}" && TEST_VERSIONS=7.4-

echo "PHPCS report: ${PHPCS_REPORT}"
echo "PHPCS severity: ${PHPCS_EXTENSIONS}"

sh -c "/root/.composer/vendor/bin/phpcs \
  --report=${PHPCS_REPORT} \
  --extensions=${PHPCS_EXTENSIONS} \
  --standard=PHPCompatibility --runtime-set testVersion ${TEST_VERSIONS} $GITHUB_WORKSPACE/app/code \
  -s $*"
