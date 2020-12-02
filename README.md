# dotfiles

## about

the `.*` files are destructively downloaded to the root directory. `macos.sh` installs and configures a bunch of stuff, then gets deleted.

## how to use
### execute immediately

`cd; curl -#L https://github.com/alitorbati/dotfiles/tarball/main | tar -xzv --strip-components 1 --exclude='README.md'; source macos.sh; rm macos.sh`

Subsequently use the `dotfiles` alias to execute that line

### or download, modify, and run

1. `git clone` blah blah
1. `cd` into the new dir
1. `source macos.sh`
