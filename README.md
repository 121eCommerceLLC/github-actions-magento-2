# GitHub Actions for Magento 2 Projects

This repository's aim is to provide a set of open sourced GitHub actions to write better tested Magento 2 Project.

# Available Actions

## Magento Coding Standard
Provides an action that can be used in your GitHub workflow to execute the latest [Magento Coding Standard](https://github.com/magento/magento-coding-standard).

#### How to use it
In your GitHub repository add the below as
`.github/workflows/coding-standard.yml`

```yaml
name: M2 Coding Standard
on:
  push:
    branches:
      - main
  pull_request:

jobs:
  coding-standard-code:
    name: M2 Coding Standard - Code
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: 121eCommerceLLC/github-actions-magento-2/coding-standard@main
        with:
          path_to_code: /app/code
          phpcs_extensions: php,phtml,graphqls/GraphQL,less/CSS,xml,js/PHP
  coding-standard-design:
    name: M2 Coding Standard - Design
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: 121eCommerceLLC/github-actions-magento-2/coding-standard@main
        with:
          path_to_code: /app/design
          phpcs_extensions: php,phtml,graphqls/GraphQL,less/CSS,xml,js/PHP
```
---

## Magento Mess Detector
Provides an action that can be used in your GitHub workflow to execute the PHP Mess Detector rules included in Magento 2 ([link](https://github.com/magento/magento2/blob/2.4.6/dev/tests/static/testsuite/Magento/Test/Php/_files/phpmd/ruleset.xml)).

#### How to use it
In your GitHub repository add the below as
`.github/workflows/mess-detector.yml`

```yaml
name: M2 Mess Detector
on:
  push:
    branches:
      - main
  pull_request:

jobs:
  mess-detector-code:
    name: M2 Mess Detector - Code
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: 121eCommerceLLC/github-actions-magento-2/mess-detector@main
        with:
          path_to_code: /app/code
  mess-detector-design:
    name: M2 Mess Detector - Design
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: 121eCommerceLLC/github-actions-magento-2/mess-detector@main
        with:
          path_to_code: /app/design
```
---

## PHP Compatibility
Provides an action that can be used in your GitHub workflow to execute the PHP Compatibility rules for specific PHP version ([link](https://github.com/PHPCompatibility/PHPCompatibility)).

#### How to use it
In your GitHub repository add the below as
`.github/workflows/php-compatibility.yml`

```yaml
name: PHP Compatibility
on:
  push:
    branches:
      - main
  pull_request:

jobs:
  php-compatibility-code:
    name: PHP Compatibility - Code
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: 121eCommerceLLC/github-actions-magento-2/php-compatibility@main
        with:
          path_to_code: /app/code
          php_versions: 7.4-
  php-compatibility-design:
    name: PHP Compatibility - Design
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: 121eCommerceLLC/github-actions-magento-2/php-compatibility@main
        with:
          path_to_code: /app/design
          php_versions: 7.4-
```
---

## Inline Styles
Provides an action that can be used in your GitHub workflow to detect inline styles.

#### How to use it
In your GitHub repository add the below as
`.github/workflows/inline-styles.yml`

```yaml
name: M2 Inline Styles
on:
  push:
    branches:
      - main
  pull_request:

jobs:
  coding-standard-code:
    name: M2 Inline Styles - Code
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: 121eCommerceLLC/ecommerce121-github-actions-magento-2/coding-standard@main
        with:
          path_to_code: /app/code
          phpcs_extensions: php/InlineCss,phtml/InlineCss,html/InlineCss
  coding-standard-design:
    name: M2 Inline Styles - Design
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: 121eCommerceLLC/ecommerce121-github-actions-magento-2/coding-standard@main
        with:
          path_to_code: /app/design
          phpcs_extensions: php/InlineCss,phtml/InlineCss,html/InlineCss
```
---

## Unnecessary Files
Provides an action that can be used in your GitHub workflow to detect unnecessary files.

#### How to use it
In your GitHub repository add the below as
`.github/workflows/unnecessary-files.yml`

```yaml
name: Unnecessary Files
on:
  push:
    branches:
      - main
  pull_request:

jobs:
  unnecessary-files:
    name: Unnecessary Files
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: 121eCommerceLLC/ecommerce121-github-actions-magento-2/coding-standard@main
        with:
          path_to_code: /
          phpcs_extensions: gz/FileType,tar/FileType,rar/FileType,zip/FileType,exe/FileType,tgz/FileType,tlz/FileType,tbz2/FileType,bak/FileType,back/FileType,asp/FileType,pass/FileType,shar/FileType,iso/FileType,bz2/FileType,lz/FileType,lz4/FileType,lzma/FileType,lzo/FileType,sz/FileType,xz/FileType,z/FileType,zst/FileType,7z/FileType,s7z/FileType,jar/FileType,sql/FileType
```
---

### How to run locally

#### PHP Code Sniffer
```shell
./vendor/bin/phpcs -p --colors --extensions=php,phtml,js,html,less --standard=Magento2 --exclude=Magento2.Annotation.MethodAnnotationStructure app/code/Ecommerce121/Module/
```

#### PHP Mess Detector
```shell
./vendor/bin/phpmd app/code/Ecommerce121/Module/ ansi dev/tests/static/testsuite/Magento/Test/Php/_files/phpmd/ruleset.xml --suffixes php,phtml
```

#### PHP Compatibility
```shell
./vendor/bin/phpcs -p --colors --extensions=php,phtml --standard=PHPCompatibility --runtime-set testVersion 7.4- app/code/Ecommerce121/Module/
```
