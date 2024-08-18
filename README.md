# Basic Things

Project template for Rust based projects hosted on Github.
Essentially matklad's [Basic Things](https://matklad.github.io/2024/03/22/basic-things.html) in action.

### Getting started

Create an empty GitHub repository and install [`cargo-generate`](https://github.com/cargo-generate/cargo-generate) before running:

```sh
cargo generate gibbz00/basic-things
```

#### Tokens

Optional public (graph) codecov token prompt may be filled in by first retrieving it from `https://app.codecov.io/gh/<repository_path>/config/badge`.
CI may expect the presence of both [`CODECOV_TOKEN`](https://docs.codecov.com/docs/adding-the-codecov-token) and [`CARGO_REGISTRY_TOKEN`](https://crates.io/settings/tokens).

### Integrated tools

* [git-cliff](https://git-cliff.org) - Automated changelog generation by the usage of conventional commits.
* [mdbook](https://github.com/rust-lang/mdBook) - Optionally enabled to create user focused documentation.
* [codecov](https://about.codecov.io/) - Optionally enabled for code coverage uploads and analysis.
* [pre-commit](https://github.com/pre-commit/pre-commit) - Optionally enabled for quicker validations before committing.

Project aims to provide a comprehensive continuous integration and delivery pipeline. This includes running CI jobs using:

* [`cargo fmt/clippy`](https://github.com/rust-lang/cargo) - Formatting and link checking of both Rust source code and doc comments
* [`taplo fmt/lint`](https://github.com/tamasfe/taplo) - Formatting and lint checking for TOML files
* [`lychee`](https://github.com/lycheeverse/lychee) - Broken URL checking
* [`cargo-udeps`](https://github.com/est31/cargo-udeps) - Finding unused dependencies
* [`typos`](https://github.com/crate-ci/typos) - Spell checking
* [`cargo-deny`](https://github.com/EmbarkStudios/cargo-deny) - Dependency license vulnerability scanning
* [`dependabot`](https://github.com/dependabot/dependabot-core) - Dependency update scanning
* [`cocogitto`](https://github.com/cocogitto/cocogitto) - Assert usage of convetional commits.

Pipeline will also executes tests with `cargo`, `mdbook` (if enabled), and `cargo llvm-cod` for code coverage reporting.
Release pipeline publishes the crates to [crates.io](https://crates.io/) and the book to [GitHub Pages](https://pages.github.com/).

### Proposed improvements

- [ ] Add support for other Git hosts other than GitHub, e.g Gitea and GitLab.
- [ ] Cocogitto conventional commit checking in `pre-commit` commit-msg hook.
- [ ] Automated releases with [`release-plz`](https://release-plz.ieni.dev)?
