if [[ "$(_os)" == "macos" ]]; then
  path=( $HOMEBREW_PREFIX/opt/ruby/bin $HOMEBREW_PREFIX/lib/ruby/gems/2.7.0/bin $path )
fi
