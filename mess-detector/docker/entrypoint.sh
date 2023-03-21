#!/bin/sh -l

cd $GITHUB_WORKSPACE

sh -c "/root/.composer/vendor/bin/phpmd \"$GITHUB_WORKSPACE/app/code\" github /ruleset.xml"
