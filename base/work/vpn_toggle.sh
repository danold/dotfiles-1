#!/bin/sh

if pgrep -x openfortivpn >/dev/null; then
  sudo $HOMEBREW_PREFIX/bin/vpn_disconnect
else
  alacritty_tmux_vpn_connect
fi
