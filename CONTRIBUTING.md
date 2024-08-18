# Contributing Guidelines

There are some things that should be kept in mind when contributing to this project.
- Commit messages must follow the [conventional commits](https://www.conventionalcommits.org) specification. This enables automated [CHANGELOG.md](CHANGELOG.md) generation by using [`git-cliff`](https://git-cliff.org).
- Each commit is should pass CI on its own.

## Release (for maintainers)

Make sure CI is not failing. Then:

```sh
# <release> should follow semantic versioning
git commit -am "chore: release <release>"
git tag "<release>"
git cliff -o CHANGELOG.md
git push && git push --tags
```
