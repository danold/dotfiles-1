# =============================================================================
#                                   Plugins
# =============================================================================

source $ZPLUG_HOME/init.zsh

# zplug
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

if [[ "$(_os)" == macos ]]; then
  # Directory colors
  zplug "seebi/dircolors-solarized", ignore:"*", as:plugin
  # Suggestions are pretty laggy on ssh connection, try disabling it on remotes
  # zplug "zsh-users/zsh-autosuggestions"
fi

# Jump back to parent directory
zplug "tarrasch/zsh-bd"

# Copy to system clipboard
zplug "kutsan/zsh-system-clipboard"
ZSH_SYSTEM_CLIPBOARD_TMUX_SUPPORT=true

zplug "plugins/z",                 from:oh-my-zsh

# zsh-syntax-highlighting must be loaded after executing compinit command
# and sourcing other plugins
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# =============================================================================
#                                   Themes
# =============================================================================

zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
