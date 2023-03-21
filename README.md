# GitHub Actions for Magento 2 Projects

This repository's aim is to provide a set of open sourced GitHub actions to write better tested Magento 2 Project.

# Available Actions

---

## Magento Coding Standard
Provides an action that can be used in your GitHub workflow to execute the latest [Magento Coding Standard](https://github.com/magento/magento-coding-standard).

#### How to use it
In your GitHub repository add the below as
`.github/workflows/coding-standard.yml`

```
name: M2 Coding Standard
on:
  push:
    branches:
      - main
  pull_request:

jobs:
  static:
    name: M2 Coding Standard
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: 121eCommerceLLC/github-actions-magento-2/coding-standard@main
```

---

## Magento Mess Detector
Provides an action that can be used in your GitHub workflow to execute the PHP Mess Detector rules included in Magento 2 ([link](https://github.com/magento/magento2/blob/2.4.6/dev/tests/static/testsuite/Magento/Test/Php/_files/phpmd/ruleset.xml)).

#### How to use it
In your GitHub repository add the below as
`.github/workflows/mess-detector.yml`

```
name: M2 Mess Detector
on:
  push:
    branches:
      - main
  pull_request:

jobs:
  phpmd:
    name: M2 Mess Detector
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: 121eCommerceLLC/github-actions-magento-2/mess-detector@main
```
