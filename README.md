# dotfiles

## execute as-is

`cd; curl -#L https://github.com/alitorbati/dotfiles/tarball/main | tar -xzv --strip-components 1 --exclude={README.md}; source macos.sh; rm macos.sh`

After the first time you can subsequently use the `dotfiles` alias to execute that line

## download, modify, and run

1. `git clone` blah blah
1. cd into dir
1. `source macos.sh`
