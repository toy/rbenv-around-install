if declare -Ff after_install >/dev/null; then
  before_install run_before_install
  after_install run_after_install
else
  echo "rbenv: rbenv-around-install plugin requires ruby-build 20130129 or later" >&2
fi

run_bin() {
  local path="$1"

  if [ -f "$path.eval" ]; then
    echo "Evaluating for $VERSION_NAME: $path.eval"
    source "$path.eval"
  fi

  if [ -x "$path" ]; then
    echo "Running for $VERSION_NAME: $path"
    RBENV_VERSION="$VERSION_NAME" $path
  fi
}

run_before_install(){
  run_bin "$(rbenv root)/before-install"
}

run_after_install(){
  # Only if successfully installed Ruby.
  [ "$STATUS" = "0" ] || return 0

  run_bin "$(rbenv root)/after-install"
}
