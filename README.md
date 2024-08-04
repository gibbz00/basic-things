# {{ project-name }} - PROJECT_DESCRIPTION

[![ci_status](https://img.shields.io/github/actions/workflow/status/GITHUB_PATH/ci.yaml?style=for-the-badge)](https://github.com/GITHUB_PATH/actions/workflows/ci.yaml)
[![codecov](https://img.shields.io/codecov/c/gh/GITHUB_PATH?token=CODE_COV_TOKEN&style=for-the-badge)](https://codecov.io/gh/GITHUB_PATH)
[![license](https://img.shields.io/github/license/GITHUB_PATH.svg?style=for-the-badge)](https://github.com/GITHUB_PATH/blob/main/LICENSE.md)

## Usage

Update the respective value in [template.sh](/template.sh) and execute it. (Assumes `fd` is installed.)
Remove `template.sh`, but also the [[#Usage]] and [[#Features]] README.md sections

### CI/CD expects the following environment variables:

`ci.yaml`

* `CODECOV_TOKEN` - for code coverage reporting

`releases.yaml`

* `CARGO_REGISTRY_TOKEN` - for crate publishing

## Features

### CI/CD

#### Linting

* cargo fmt
* cargo clippy
* taplo lint
* taplo fmt
* cargo doc warnings
* lychee - link checking
* cargo udeps - unused dependencies
* typos

#### Testing

* cargo test
* mdbook test
* cargo llvm-cod - uploaded to codecov

#### Misc

* cargo deny - dependency vulnerability scanning
* dependabot - weekly depencendy updates scanning

#### Release

* On tagged commits only
* mdbook publish
* cargo publish

## Further reading

* [Architecture](ARCHITECTURE_URL)
* [Contributing](/CODE_OF_CONDUCT.md)
* [Code of conduct](/CODE_OF_CONDUCT.md)
* [Security policy](/SECURITY.md)
