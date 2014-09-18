# rbenv-around-install

Automatically run `~/.rbenv/before-install` before and `~/.rbenv/after-install` after `rbenv install`.
Add extension `.eval` to eval instead of running those binaries.
Don't forget to run `chmod u+x ~/.rbenv/before-install ~/.rbenv/after-install`.

## Installation

```sh
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/toy/rbenv-around-install.git "$(rbenv root)"/plugins/rbenv-around-install
```
