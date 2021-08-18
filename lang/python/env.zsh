if [[ "$(_os)" == "macos" ]]; then
  path=( $HOMEBREW_PREFIX/opt/python/libexec/bin $path )
fi
