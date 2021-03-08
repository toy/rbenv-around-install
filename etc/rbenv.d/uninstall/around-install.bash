if declare -Ff after_uninstall >/dev/null; then
  before_uninstall run_before_uninstall
  after_uninstall run_after_uninstall
else
  echo "rbenv: rbenv-around-install plugin requires ruby-build 20130129 or later" >&2
fi

run_bin() {
  local bin="$1"

  if [ -f "$bin.eval" ]; then
    echo "Evaluating for $VERSION_NAME: $bin.eval"
    source "$bin.eval"
  fi

  if [ -x "$bin" ]; then
    echo "Running for $VERSION_NAME: $bin"
    "$bin"
  fi
}

run_before_uninstall(){
  run_bin "$(rbenv root)/before-uninstall"
}

run_after_uninstall(){
  run_bin "$(rbenv root)/after-uninstall"
}
