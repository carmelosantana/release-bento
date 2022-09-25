# 🍱 Release Bento

*A simple package builder.*

## Features

- Quickly build a `.zip` archive of your package.
- Customize folder structure.

## Installation

> **Note:** This package is in active development and is not yet available on Packagist.

Add the repository to your `composer.json` file:

```json
"repositories": [
    {
        "type": "vcs",
        "url": "https://github.com/carmelosantana/release-bento"
    }
],
"require-dev": {
    "carmelosantana/release-bento": "dev-main"
}
"scripts": {
    "bento": [
        "CarmeloSantana\\ReleaseBento\\ReleaseBento::execute"
    ]
}
```

## Usage

Navigate to the root of your package and run the following command:

```bash
composer bento
```

This will create an archive of your package in the `_builds` directory.

📌 **Note:** Add `_builds` to `.gitingore`.

## Funding

If you find **Release Bento** useful or use it in a commercial environment please consider donating today with one of the following options.

- [PayPal](https://www.paypal.com/donate?hosted_button_id=5RKFT8CT6DAVE)
- Bitcoin `bc1qhxu9yf9g5jkazy6h4ux6c2apakfr90g2rkwu45`
- Ethereum `0x9f5D6dd018758891668BF2AC547D38515140460f`

## License

The code is licensed [MIT](https://opensource.org/licenses/MIT) and the documentation is licensed [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/).
