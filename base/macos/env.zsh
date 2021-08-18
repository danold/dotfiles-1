# Add brew to path
path=( /opt/homebrew/{s,}bin /usr/local/{s,}bin $path  )

export HOMEBREW_PREFIX=$(brew --prefix)

export XDG_RUNTIME_DIR=${HOME}/.run
