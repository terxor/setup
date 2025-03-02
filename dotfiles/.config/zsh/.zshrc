# --------------------------------
# oh-my-zsh
# --------------------------------

ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  vi-mode # always keep first, otherwise it breaks fzf and fzf-tab
  git
  fzf
  fzf-tab
)

source $ZSH/oh-my-zsh.sh

# --------------------------------
# general
# --------------------------------

bindkey -M vicmd ';'  end-of-line
bindkey -M viins 'kj' vi-cmd-mode
bindkey -M vicmd 'kj' vi-cmd-mode # basically no-op

# The prompt shows status of last command in first line.
# The full directory (unless ~) in the second line.
# The j part shows number of suspended jobs
PROMPT='%(?:%F{green}OK%f:%F{red}FAILED%f) %F{white}($?)%f
%F{blue}%~%f%F{red}%(1j. [%j].)%f $(git_prompt_info)'

# --------------------------------
# exports
# --------------------------------

PATH="$HOME/.local/bin:$PATH"

# Better colors for fzf results
FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --color=fg:#757575,bg:#ffffff,hl:#48698a --color=fg+:#000000,bg+:#ffffff,hl+:#5196ad --color=info:#afaf87,prompt:#d7005f,pointer:#af5fff --color=marker:#87ff00,spinner:#af5fff,header:#87afaf'

# CP utils
CP_UTILS=$HOME/workspace/cs/cp/util

# Texlive
PATH=$PATH:$HOME/bin/texlive/bin/x86_64-linux

# Gems
PATH="$PATH:$HOME/gems/bin"

# --------------------------------
# aliases
# --------------------------------

alias py='python3'
alias vim='nvim'

# git diff aliases to use vimdiff
alias gd="git difftool"
alias gds="git difftool --staged"

# git status of multiple repositories under a dir
alias gitstat='find . -maxdepth 1 -mindepth 1 -type d -exec sh -c "(echo {} && cd {} && git status -s && echo)" \;'

# show dotfiles/dirs by default but ignore .git
alias tree='tree -a -I .git'

# --------------------------------
# utils
# --------------------------------
source $ZDOTDIR/fsearch.zsh

