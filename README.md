# {{ project-name }}

[![ci_status](https://img.shields.io/github/actions/workflow/status/{{ repository_path }}/ci.yaml?style=for-the-badge)](https://github.com/{{ repository_path }}/actions/workflows/ci.yaml)
{% if optional_codecov != "" %}
[![codecov](https://img.shields.io/codecov/c/gh/{{ repository_path }}?token={{ optional_codecov }}&style=for-the-badge)](https://codecov.io/gh/{{ repository_path }})
{% endif %}
[![license](https://img.shields.io/github/license/{{ repository_path }}.svg?style=for-the-badge)](https://github.com/{{ repository_path }}/blob/main/LICENSE.md)

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

{% if architecture_url != "" %}
* [Architecture]({{ architecture_url }})
{% endif %}
* [Contributing](/CODE_OF_CONDUCT.md)
* [Code of conduct](/CODE_OF_CONDUCT.md)
* [Security policy](/SECURITY.md)
