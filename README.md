# 🍱 Release Bento

*A simple package builder.*

## Features

- Quickly build a `.zip` archive of your package.
- Customize folder structure.

## Installation

### 1. Install the package

Install as a developer dependency:

```bash
composer require --dev carmelosantana/release-bento
```

### 2. Add the script

Add the repository to your `composer.json` file:

```json
"scripts": {
    "bento": [
        "CarmeloSantana\\ReleaseBento\\Package::build"
    ]
}
```

## Usage

Navigate to the root of your package and run the following command:

```bash
composer bento
```

Prompts will guide you through building your package. On completion an archive of your package can be found in the `_builds` directory.

📌 **Note:** Add `_builds` to `.gitingore`.

## Funding

If you find **Release Bento** useful or use it in a commercial environment please consider donating today with one of the following options.

- Bitcoin `bc1qhxu9yf9g5jkazy6h4ux6c2apakfr90g2rkwu45`
- Ethereum `0x9f5D6dd018758891668BF2AC547D38515140460f`

## License

The code is licensed [MIT](https://opensource.org/licenses/MIT) and the documentation is licensed [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/).
