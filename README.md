# homebrew-tap

Homebrew casks for my apps.

```sh
brew install TheFilipcom4607/tap/ffmep
```

Use the full name: Homebrew 7 won't load a cask from a tap it doesn't trust by its short
name alone, and the full name is what tells it you meant this one.

## Releasing

`scripts/release.sh` in the ffmep repo rewrites `version` and `sha256` here after it
notarizes a DMG. Commit and push the change once the GitHub release is published, or
`brew` will fetch a file that isn't there yet.
