# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# ---
export SETUP_REPO=$HOME/workspace/setup
PATH="$SETUP_REPO/utils:$PATH"

alias py='python3'

# Better colors for fzf results
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --color=fg:#757575,bg:#ffffff,hl:#48698a --color=fg+:#000000,bg+:#ffffff,hl+:#5196ad --color=info:#afaf87,prompt:#d7005f,pointer:#af5fff --color=marker:#87ff00,spinner:#af5fff,header:#87afaf'

# CP utils
export CP_UTILS=$HOME/workspace/cp/util
