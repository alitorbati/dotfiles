# dotfiles

## about

the `.*` files are destructively downloaded to the root directory. they will overwrite existing files. `macos.sh` installs and configures a bunch of stuff, then gets deleted.

## how to use

### option 1: execute immediately

`cd; curl -#L https://github.com/alitorbati/dotfiles/tarball/main | tar -xzv --strip-components 1 --exclude={'README.md','install.sh','iterm2.plist'}; source macos.sh; rm macos.sh;`

Subsequently use the `dotfiles` alias to execute that command.

### option 2: download, modify, and execute

1. `git clone` blah blah
1. `cd` into the new dir
1. modify stuff as needed
1. run `source macos.sh` to execute
