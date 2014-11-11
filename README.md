# rbenv-around-install

Automatically run `~/.rbenv/before-install` before and `~/.rbenv/after-install` after `rbenv install`.
Add extension `.eval` to eval instead of running those binaries.
Don't forget to run `chmod u+x ~/.rbenv/before-install ~/.rbenv/after-install`.
Note that without `.eval` extension it must be a bash script, otherwise it can be any proper executable.

## Examples

Set environment variables for installing ruby in `before-install.eval`:

```sh
case $VERSION_NAME in
  2.*) export CC=clang;;
esac
```

Update rubygems, install few gems and rehash in `after-install`:

```sh
#!/usr/bin/env bash

gem update --system

gem install rake pry bundler rubygems-bundler mate
gem install nokogiri -- --use-system-libraries

rbenv rehash
```

## Installation

```sh
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/toy/rbenv-around-install.git "$(rbenv root)"/plugins/rbenv-around-install
```
