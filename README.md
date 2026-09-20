# homebrew-tap

Homebrew casks for my apps.

```sh
brew tap TheFilipcom4607/tap
brew install --cask ffmep
```

## Releasing

`scripts/release.sh` in the ffmep repo rewrites `version` and `sha256` here after it
notarizes a DMG. Commit and push the change once the GitHub release is published, or
`brew` will fetch a file that isn't there yet.
