# GitHub Actions for Magento 2 Projects

This repository's aim is to provide a set of open sourced GitHub actions to write better tested Magento 2 Project.

# Available Actions

## Coding Standard
Provides an action that can be used in your GitHub workflow to execute the latest [Magento Coding Standard](https://github.com/magento/magento-coding-standard).

> To speed up the action, an additional [cache](https://github.com/marketplace/actions/cache) component is used. This component caches Composer dependencies.

### How to use it
In your GitHub repository add the below as
`.github/workflows/coding-standard.yml`

```yaml
name: Coding Standard
on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main
jobs:
  coding-standard:
    name: Coding Standard
    runs-on: ubuntu-latest
    strategy:
      fail-fast: false
      matrix:
        path-to-code: [ /app/code, /app/design ]
    steps:
      - uses: 121eCommerceLLC/github-actions-magento-2/coding-standard@v2
        with:
          path-to-code: ${{ matrix.path-to-code }}
```

#### Available Arguments

> Detailed information about common arguments is available in a [Common Arguments](#common-arguments) section.

| Argument                                                                | Default Value                                                                                                       |
|:------------------------------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------|
| [`php-version`](#php-version)                                         | `8.2`                                                                                                               |
| [`php-extensions`](#php-extensions)                                   | `gd, bcmath, soap, pdo_mysql, ctype, curl, dom, hash, iconv, intl, mbstring, openssl, simplexml, xsl, sockets, zip` |
| [`composer-version`](#composer-version)                               | `v2` - latest stable Composer 2 version.                                                                            |
| [`magento-coding-standard-version`](#magento-coding-standard-version) | `*` - latest stable version.                                                                                        |
| [`path-to-code`](#path-to-code)                                       | `/`                                                                                                                 |
| [`phpcs-extensions`](#phpcs-extensions)                               | `php,phtml,graphqls/GraphQL,less/CSS,xml,js/PHP`                                                                    |
| [`phpcs-ruleset`](#phpcs-ruleset)                                     | There is no default value, the basic ruleset will be used.                                                          |
| [`skip-cache`](#skip-cache)                                           | `false`                                                                                                             |

#### Specific Action Arguments

- #### `magento-coding-standard-version`

  Default: `*` latest stable version.
  <br />
  
  The argument is used to provide an opportunity to specify a custom version of the [Magento Coding Standard](https://github.com/magento/magento-coding-standard). By default, the most up-to-date version will be installed.
  <br />
  
  This may be necessary in cases where an outdated version of Magento is used, and an outdated version of the standard must be used for it, since new versions may add new sniffers that are incompatible with outdated versions of Magento.
  <br />
  
  A list of available versions can be found on the [releases page](https://github.com/magento/magento-coding-standard/releases) of the standard.
  <br />

  Example: `magento-coding-standard-version: v31`

- #### `phpcs-extensions`

  Default: `php,phtml,graphqls/GraphQL,less/CSS,xml,js/PHP`
  <br />
  
  The argument is used to provide an opportunity to specify a custom list of extensions for the `--extensions` argument for the `phpcs` [tool](https://github.com/squizlabs/PHP_CodeSniffer/wiki/Advanced-Usage#specifying-valid-file-extensions).
  <br />
  
  By default, the list of extensions has already been prepared according to the [Magento Coding Standard](https://github.com/magento/magento-coding-standard/blob/v31/Magento2/ruleset.xml#L6).
  <br />
  
  Example: `phpcs-extensions: php,phtml,graphqls/GraphQL,less/CSS,html/PHP,xml,js/PHP`

- #### `phpcs-ruleset`

  Default: `There is no default value, the basic ruleset will be used.`
  <br />
  
  The argument is used to provide an opportunity to specify a custom ruleset. By default, a [basic ruleset](https://github.com/121eCommerceLLC/github-actions-magento-2/blob/v2/coding-standard/ruleset.xml) based on the [Magento Coding Standard](https://github.com/magento/magento-coding-standard) is used, with the exception of some annoying, but not mandatory rules.
  <br />
  
  In order to use your own ruleset, you need to create your own ruleset file according to the [instructions](https://github.com/squizlabs/PHP_CodeSniffer/wiki/Annotated-Ruleset) and add it to the repository file. Then you need to provide the absolute path to this file relative to the repository starting with the slash `/` character.
  <br />
  
  Example: `phpcs-ruleset: /path/to/your/ruleset.xml`

---

## Mess Detector
Provides an action that can be used in your GitHub workflow to execute the [PHP Mess Detector rules](https://github.com/magento/magento2/blob/2.4.6/dev/tests/static/testsuite/Magento/Test/Php/_files/phpmd/ruleset.xml) included in Magento 2.

> To speed up the action, an additional [cache](https://github.com/marketplace/actions/cache) component is used. This component caches Composer dependencies.

### How to use it
In your GitHub repository add the below as
`.github/workflows/mess-detector.yml`

```yaml
name: Mess Detector
on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main
jobs:
  mess-detector:
    name: Mess Detector
    runs-on: ubuntu-latest
    strategy:
      fail-fast: false
      matrix:
        path-to-code: [ /app/code, /app/design ]
    steps:
      - uses: 121eCommerceLLC/github-actions-magento-2/mess-detector@v2
        with:
          path-to-code: ${{ matrix.path-to-code }}
```

#### Available Arguments

> Detailed information about common arguments is available in a [Common Arguments](#common-arguments) section.

| Argument                                  | Default Value                                                                                                       |
|:------------------------------------------|:--------------------------------------------------------------------------------------------------------------------|
| [`php-version`](#php-version)           | `8.2`                                                                                                               |
| [`php-extensions`](#php-extensions)     | `gd, bcmath, soap, pdo_mysql, ctype, curl, dom, hash, iconv, intl, mbstring, openssl, simplexml, xsl, sockets, zip` |
| [`composer-version`](#composer-version) | `v2` - latest stable Composer 2                                                                                     |
| [`phpmd-version`](#phpmd-version)       | `*` - latest stable version                                                                                         |
| [`path-to-code`](#path-to-code)         | `/`                                                                                                                 |
| [`phpmd-ruleset`](#phpmd-ruleset)       | There is no default value, the basic ruleset will be used.                                                          |
| [`skip-cache`](#skip-cache)             | `false`                                                                                                             |

#### Specific Action Arguments

- #### `phpmd-version`

  Default: `*` latest stable version.
  <br />

  The argument is used to provide an opportunity to specify a custom version of the [PHP Mess Detector](https://github.com/phpmd/phpmd). By default, the most up-to-date version will be installed.
  <br />

  This may be necessary in cases where an outdated version of Magento is used, and an outdated version of the detector must be used for it, since new versions may add new rules that are incompatible with outdated versions of Magento.
  <br />

  A list of available versions can be found on the [releases page](https://github.com/phpmd/phpmd/releases) of the tool.
  <br />

  Example: `phpmd-version: 2.13.0`

- #### `phpmd-ruleset`

  Default: `There is no default value, the basic ruleset will be used.`
  <br />

  The argument is used to provide an opportunity to specify a custom ruleset. By default, a [basic ruleset](https://github.com/121eCommerceLLC/github-actions-magento-2/blob/v2/mess-detector/ruleset.xml) based on the [Magento 2](https://github.com/magento/magento2/blob/2.4.6/dev/tests/static/testsuite/Magento/Test/Php/_files/phpmd/ruleset.xml) is used.
  <br />

  In order to use your own ruleset, you need to create your own ruleset file according to the [instructions](https://phpmd.org/documentation/creating-a-ruleset.html) and add it to the repository file. Then you need to provide the absolute path to this file relative to the repository starting with the slash `/` character.
  <br />

  Example: `phpmd-ruleset: /path/to/your/ruleset.xml`

### In the example above, the specific rules provided by Magento will not be used for checking.

- [AllPurposeAction](https://github.com/magento/magento2/blob/2.4.6/dev/tests/static/framework/Magento/CodeMessDetector/Rule/Design/AllPurposeAction.php) - Actions must process a defined list of HTTP methods.
- [CookieAndSessionMisuse](https://github.com/magento/magento2/blob/2.4.6/dev/tests/static/framework/Magento/CodeMessDetector/Rule/Design/CookieAndSessionMisuse.php) - Session and Cookies must be used only in HTML Presentation layer.

In order for these rules to also be included in the check, use the following action.

In your GitHub repository add the below as
`.github/workflows/mess-detector.yml`

```yaml
name: Mess Detector
on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main
jobs:
  mess-detector:
    name: Mess Detector
    runs-on: ubuntu-latest
    strategy:
      fail-fast: false
      matrix:
        path-to-code: [ /app/code, /app/design ]
    steps:
      - uses: 121eCommerceLLC/github-actions-magento-2/mess-detector-full@v2
        with:
          path-to-code: ${{ matrix.path-to-code }}
```

#### Available Arguments

> Detailed information about common arguments is available in a [Common Arguments](#common-arguments) section.

| Argument                                  | Default Value                                                                                                       |
|:------------------------------------------|:--------------------------------------------------------------------------------------------------------------------|
| [`php-version`](#php-version)           | `8.2`                                                                                                               |
| [`php-extensions`](#php-extensions)     | `gd, bcmath, soap, pdo_mysql, ctype, curl, dom, hash, iconv, intl, mbstring, openssl, simplexml, xsl, sockets, zip` |
| [`composer-version`](#composer-version) | `v2` - latest stable Composer 2                                                                                     |
| [`path-to-code`](#path-to-code)         | `/`                                                                                                                 |
| [`phpmd-ruleset`](#phpmd-ruleset-1)     | `./dev/tests/static/testsuite/Magento/Test/Php/_files/phpmd/ruleset.xml`                                            |
| [`skip-cache`](#skip-cache)             | `false`                                                                                                             |

> `phpmd-version` argument is missing, since the version from the `composer.lock` file in the project will be installed.

#### Specific Action Arguments

- #### `phpmd-ruleset`

  Default: `./dev/tests/static/testsuite/Magento/Test/Php/_files/phpmd/ruleset.xml`
  <br />

  The argument is used to provide an opportunity to specify a custom ruleset. By default, a [basic ruleset](https://github.com/121eCommerceLLC/github-actions-magento-2/blob/v2/mess-detector/ruleset.xml) based on the [Magento 2](https://github.com/magento/magento2/blob/2.4.6/dev/tests/static/testsuite/Magento/Test/Php/_files/phpmd/ruleset.xml) is used.
  <br />

  In order to use your own ruleset, you need to create your own ruleset file according to the [instructions](https://phpmd.org/documentation/creating-a-ruleset.html) and add it to the repository file. Then you need to provide the absolute path to this file relative to the repository starting with the slash `/` character.
  <br />

  Example: `phpmd-ruleset: /path/to/your/ruleset.xml`

During the operation of this action, the `composer install` command is executed, which leads to an increase in execution time. It is also possible to use a mixed workflow: check the `app/code` folder with a full action, and the `app/design` folder with a stripped-down one, since specific rules do not affect files in the `app/design` folder.

```yaml
name: Mess Detector
on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main
jobs:
  mess-detector-code:
    name: Mess Detector - Code
    runs-on: ubuntu-latest
    steps:
      - uses: 121eCommerceLLC/github-actions-magento-2/mess-detector-full@v2
        with:
          path-to-code: /app/code
  mess-detector-design:
    name: Mess Detector - Design
    runs-on: ubuntu-latest
    steps:
      - uses: 121eCommerceLLC/github-actions-magento-2/mess-detector@v2
        with:
          path-to-code: /app/design
```

---

## PHP Compatibility
Provides an action that can be used in your GitHub workflow to execute the [PHP Compatibility rules](https://github.com/PHPCompatibility/PHPCompatibility) for specific PHP version.

> To speed up the action, an additional [cache](https://github.com/marketplace/actions/cache) component is used. This component caches Composer dependencies.

### How to use it
In your GitHub repository add the below as
`.github/workflows/php-compatibility.yml`

```yaml
name: PHP Compatibility
on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main
jobs:
  php-compatibility:
    name: PHP Compatibility
    runs-on: ubuntu-latest
    strategy:
      fail-fast: false
      matrix:
        path-to-code: [ /app/code, /app/design ]
    steps:
      - uses: 121eCommerceLLC/github-actions-magento-2/php-compatibility@v2
        with:
          path-to-code: ${{ matrix.path-to-code }}
```

#### Available Arguments

> Detailed information about common arguments is available in a [Common Arguments](#common-arguments) section.

| Argument                                                                | Default Value                                                                                                       |
|:------------------------------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------|
| [`php-version`](#php-version)                                         | `8.2`                                                                                                               |
| [`php-extensions`](#php-extensions)                                   | `gd, bcmath, soap, pdo_mysql, ctype, curl, dom, hash, iconv, intl, mbstring, openssl, simplexml, xsl, sockets, zip` |
| [`composer-version`](#composer-version)                               | `v2` - latest stable Composer 2                                                                                     |
| [`php-compatibility-version`](#php-compatibility-version)             | `10.x-dev`                                                                                                          |
| [`path-to-code`](#path-to-code)                                       | `/`                                                                                                                 |
| [`php-compatibility-ruleset`](#php-compatibility-ruleset)             | There is no default value, the basic ruleset will be used.                                                          |
| [`php-compatibility-test-versions`](#php-compatibility-test-versions) | `8.2-`                                                                                                              |
| [`skip-cache`](#skip-cache)                                           | `false`                                                                                                             |

#### Specific Action Arguments

- #### `php-compatibility-version`

  Default: `10.x-dev`.
  <br />

  The argument is used to provide an opportunity to specify a custom version of the [PHP Compatibility](https://github.com/PHPCompatibility/PHPCompatibility). By default, the version `10.x-dev` is used, since it supports the current versions of PHP8+, but it has not been released yet.
  <br />

  This may be necessary in cases where an outdated version of Magento is used, and an outdated version of the tool must be used for it, since new versions may add new rules that are incompatible with outdated versions of Magento.
  <br />

  A list of available versions can be found on the [releases page](https://github.com/PHPCompatibility/PHPCompatibility/releases) of the tool.
  <br />

  Example: `php-compatibility-version: 9.3.5`

- #### `php-compatibility-ruleset`

  Default: `There is no default value, the basic ruleset will be used.`
  <br />

  The argument is used to provide an opportunity to specify a custom ruleset. By default, a [basic ruleset](https://github.com/121eCommerceLLC/github-actions-magento-2/blob/v2/php-compatibility/ruleset.xml) based on the [PHP Compatibility](https://github.com/PHPCompatibility/PHPCompatibility) is used, with the exception of some annoying, but not mandatory rules.
  <br />

  In order to use your own ruleset, you need to create your own ruleset file according to the [instructions](https://github.com/squizlabs/PHP_CodeSniffer/wiki/Annotated-Ruleset) and add it to the repository file. Then you need to provide the absolute path to this file relative to the repository starting with the slash `/` character.
  <br />

  Example: `php-compatibility-ruleset: /path/to/your/ruleset.xml`

- #### `php-compatibility-test-versions`

  Default: `8.2-`
  <br />

  The argument is used to provide an opportunity to specify a custom test versions range.
  <br />

  To get the most out of the PHPCompatibility standard, you should [specify](https://github.com/PHPCompatibility/PHPCompatibility#sniffing-your-code-for-compatibility-with-specific-php-versions) a `php-compatibility-test-versions` to check against. That will enable the checks for both deprecated/removed PHP features as well as the detection of code using new PHP features.
  <br />

  Examples:
  - You can run the checks for just one specific PHP version by adding `php-compatibility-test-versions: 8.2` to step arguments.
  - You can also specify a range of PHP versions that your code needs to support. In this situation, compatibility issues that affect any of the PHP versions in that range will be reported: `php-compatibility-test-versions: 7.4-8.2`.
  - You can omit one part of the range if you want to support everything above or below a particular version, i.e. use `php-compatibility-test-versions: 7.4-` to run all the checks for PHP 7.4 and above.

---

## PHPStan
Provides an action that can be used in your GitHub workflow to execute the [PHPStan rules](https://github.com/magento/magento2/blob/2.4.6/dev/tests/static/framework/Magento/TestFramework/CodingStandard/Tool/PhpStan.php) included in Magento 2.

> To speed up the action, an additional [cache](https://github.com/marketplace/actions/cache) component is used. This component caches Composer dependencies.

### How to use it
In your GitHub repository add the below as
`.github/workflows/phpstan.yml`

```yaml
name: PHPStan
on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main
jobs:
  phpstan:
    name: PHPStan
    runs-on: ubuntu-latest
    strategy:
      fail-fast: false
      matrix:
        path-to-code: [ /app/code, /app/design ]
    steps:
      - uses: 121eCommerceLLC/github-actions-magento-2/phpstan@v2
        with:
          path-to-code: ${{ matrix.path-to-code }}
```

#### Available Arguments

> Detailed information about common arguments is available in a [Common Arguments](#common-arguments) section.

| Argument                                            | Default Value                                                                                                       |
|:----------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------|
| [`php-version`](#php-version)                     | `8.2`                                                                                                               |
| [`php-extensions`](#php-extensions)               | `gd, bcmath, soap, pdo_mysql, ctype, curl, dom, hash, iconv, intl, mbstring, openssl, simplexml, xsl, sockets, zip` |
| [`composer-version`](#composer-version)           | `v2` - latest stable Composer 2                                                                                     |
| [`path-to-code`](#path-to-code)                   | `/`                                                                                                                 |
| [`phpstan-configuration`](#phpstan-configuration) | `./dev/tests/static/testsuite/Magento/Test/Php/_files/phpstan/phpstan.neon`                                         |
| [`phpstan-level`](#phpstan-level)                 | `1`                                                                                                                 |
| [`setup-di-compile`](#setup-di-compile)           | `true`                                                                                                              |
| [`skip-cache`](#skip-cache)                       | `false`                                                                                                             |

#### `Specific Action Arguments`

- #### `phpstan-configuration`

  Default: `./dev/tests/static/testsuite/Magento/Test/Php/_files/phpstan/phpstan.neon`
  <br />

  The argument is used to provide an opportunity to specify a custom configuration. By default, a [basic configuration](https://github.com/magento/magento2/blob/2.4.6/dev/tests/static/testsuite/Magento/Test/Php/_files/phpstan/phpstan.neon) is used.
  <br />

  In order to use your own configuration, you need to create your own configuration file according to the [instructions](https://phpstan.org/config-reference) and add it to the repository file. Then you need to provide the absolute path to this file relative to the repository starting with the slash `/` character.
  <br />

  Example: `phpstan-configuration: /path/to/your/configuration.neon`

- #### `phpstan-level`

  Default: `1`
  <br />

  The argument is used to provide an opportunity to specify a custom check level.
  <br />

  If you want to use PHPStan but your codebase isn’t up to speed with strong typing and PHPStan’s strict checks, you can currently choose from 10 [levels](https://phpstan.org/user-guide/rule-levels) (`0` is the loosest and `9` is the strictest).
  <br />

  You can also use `max` as an alias for the highest level. This will ensure that you will always use the highest level when upgrading to new versions of PHPStan.
  > Please note that this can create a significant obstacle when upgrading to a newer version because you might have to fix a lot of code to bring the number of errors down to zero.

  Example: `phpstan-level: 5`

- #### `setup-di-compile`

  Default: `true`
  <br />

  The argument is used to provide an opportunity to disable dependency compilation during check. Since part of the code is generated automatically in magento and this code is not in the repository, false positive errors may appear during static analysis due to the fact that some auto-generated classes are missing.
  <br />

  To disable dependency compilation, pass `false` value .
  <br />

  Example: `setup-di-compile: false`

---

## Inline Styles
Provides an action that can be used in your GitHub workflow to detect inline styles.

### How to use it
In your GitHub repository add the below as
`.github/workflows/inline-styles.yml`

```yaml
name: Inline Styles
on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main
jobs:
  inline-styles:
    name: Inline Styles
    runs-on: ubuntu-latest
    strategy:
      fail-fast: false
      matrix:
        path-to-code: [ /app/code, /app/design ]
    steps:
      - uses: 121eCommerceLLC/github-actions-magento-2/inline-styles@v2
        with:
          path-to-code: ${{ matrix.path-to-code }}
```

#### Available Arguments

> Detailed information about common arguments is available in a [Common Arguments](#common-arguments) section.

| Argument                                | Default Value    |
|:----------------------------------------|:-----------------|
| [`path-to-code`](#path-to-code)       | `/`              |
| [`file-extensions`](#file-extensions) | `php phtml html` |

#### Specific Action Arguments

- #### `file-extensions`

  Default: `php phtml html`
  <br />

  The argument is used to provide an opportunity to specify a custom list of the file extensions.
  <br />

  To add a file type for checking, you need to add it to the `file-extensions` parameter. For example, if we need to add `.js` extension, then add ` js` to the existing file types separated by space.
  <br />

  Example: `file-extensions: php phtml html js`

---

## Unnecessary Files
Provides an action that can be used in your GitHub workflow to detect unnecessary files.

### How to use it
In your GitHub repository add the below as
`.github/workflows/unnecessary-files.yml`

```yaml
name: Unnecessary Files
on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main
jobs:
  unnecessary-files:
    name: Unnecessary Files
    runs-on: ubuntu-latest
    steps:
      - uses: 121eCommerceLLC/github-actions-magento-2/unnecessary-files@v2
```

#### Available Arguments

> Detailed information about common arguments is available in a [Common Arguments](#common-arguments) section.

| Argument                                                        | Default Value                                                                                                        |
|:----------------------------------------------------------------|:---------------------------------------------------------------------------------------------------------------------|
| [`path-to-code`](#path-to-code)                               | `/`                                                                                                                  |
| [`unnecessary-file-extensions`](#unnecessary-file-extensions) | `7z asp back bak bz2 exe gz iso jar lz lz4 lzma lzo pass rar s7z shar sql sz tar tbz2 tgz tlz xz z zip zst DS_Store` |

#### Specific Action Arguments

- #### `unnecessary-file-extensions`

  Default: `7z asp back bak bz2 exe gz iso jar lz lz4 lzma lzo pass rar s7z shar sql sz tar tbz2 tgz tlz xz z zip zst DS_Store`
  <br />

  The argument is used to provide an opportunity to specify a custom list of the unnecessary file extensions.
  <br />

  To add a file type for checking, you need to add it to the `unnecessary-file-extensions` parameter. For example, if we need to add `.secret` extension, then add ` secret` to the existing file types separated by space.
  <br />

  Example: `unnecessary-file-extensions: 7z asp back bak bz2 exe gz iso jar lz lz4 lzma lzo pass rar s7z shar sql sz tar tbz2 tgz tlz xz z zip zst DS_Store secret`

---

## Common Arguments

The following arguments are common to many of the actions described above.

- #### `php-version`

  Default: `8.2`
  <br />

  The argument is used to provide an opportunity to specify a custom PHP version.
  <br />

  To configure PHP, a third party action [shivammathur/setup-php](https://github.com/marketplace/actions/setup-php-action) is used.
  <br />

  In order to specify the desired version, you need to select the supported version from the [list](https://github.com/marketplace/actions/setup-php-action#tada-php-support). Supported versions are from PHP 5.6 to PHP 8.3.
  <br />

  Example: `php-version: 7.4`

- #### `php-extensions`

  Default: `8.2`
  <br />

  The argument is used to provide an opportunity to specify a custom PHP extension list. At the moment, the list of required extensions for Magento is specified.
  <br />

  This argument has the possibility of flexible configuration, you can find out about all the possibilities in the [documentation](https://github.com/marketplace/actions/setup-php-action#heavy_plus_sign-php-extension-support).
  <br />

  To add an extension, you need to add it to the `php-extensions` parameter. For example, if we need to add `swoole` extension, then add `, swoole` to the existing file types separated by comma.
  <br />

  Example: `php-extensions: gd, bcmath, soap, pdo_mysql, ctype, curl, dom, hash, iconv, intl, mbstring, openssl, simplexml, xsl, sockets, zip, swoole`

- #### `composer-version`

  Default: `v2`
  <br />

  The argument is used to provide an opportunity to specify a custom Composer Version.
  <br />
  
  You can set up the required `composer` version by specifying the major version `v1` or `v2`, or the version in `major.minor` or `semver` format. Additionally, for composer `snapshot` and `preview` can also be specified to set up the respective releases.
  <br />

  Example: `composer-version: 1.10.26`

- #### `path-to-code`

  Default: `/`
  <br />

  The argument is used to provide an opportunity to specify a custom path to code.
  <br />

  In our examples, almost all actions are run for the `/app/code` and `/app/design` folders, but in some situations we may need to run a check on some subfolders, for example, third-party modules were installed in the `/app/code` folder, and now when running checks there are errors unrelated to our code because of which we cannot make a merge of pull request, as this may be restricted in the repository settings. For such cases, we can simply specify the folder `/app/code/Ecommerce121` and thereby circumvent this restriction.
  <br />

  The same situation is with the `/app/desing` folder, if we have several themes installed, but we only want to check a certain one, then we can simply specify the path to our theme.
  <br />

  Example: `path-to-code: /app/code/Ecommerce121`

- #### `skip-cache`

  Default: `false`
  <br />

  The argument is used to provide an opportunity to disable caching of composer dependencies. During the execution of actions that use `composer` to install dependencies, an additional step of caching dependencies is performed in order to reduce the execution time of the action. When launching actions, the cache is checked and previously loaded dependencies are used.
  <br />

  To disable caching, pass `true` value.
  <br />

  Example: `skip-cache: true`

---

## How to run locally

### Coding Standard
```shell
./vendor/bin/phpcs -p --colors --extensions=php,phtml,graphqls/GraphQL,less/CSS,xml,js/PHP --standard=Magento2 --exclude=Magento2.Annotation.MethodAnnotationStructure ./app/code/Ecommerce121/Module/
```

### Mess Detector
```shell
./vendor/bin/phpmd ./app/code/Ecommerce121/Module/ ansi ./dev/tests/static/testsuite/Magento/Test/Php/_files/phpmd/ruleset.xml --suffixes php,phtml
```

### PHP Compatibility
```shell
./vendor/bin/phpcs -p --colors --extensions=php,phtml --standard=PHPCompatibility --runtime-set testVersion 7.4- ./app/code/Ecommerce121/Module/
```

### PHPStan
To run `phpstan`, the preparation commands must be executed:
```shell
composer require --dev phpstan/phpstan --no-install
composer require --dev bitexpert/phpstan-magento --no-install
composer require --dev phpstan/extension-installer --no-install
composer config --no-plugins allow-plugins.phpstan/extension-installer true
composer install
```

Then the following command can be executed:
```shell
./vendor/bin/phpstan analyze ./app/code/Ecommerce121/Module/ --level 1 --configuration ./dev/tests/static/testsuite/Magento/Test/Php/_files/phpstan/phpstan.neon
```
