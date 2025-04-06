PATH="$HOME/.local/bin:$PATH"

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
EDITOR=nvim

# Makes esc work without delay in vi-mode
KEYTIMEOUT=1

bindkey -M vicmd ';'  end-of-line

# The prompt shows status of last command in first line.
# The full directory (unless ~) in the second line.
# The j part shows number of suspended jobs
PROMPT='%(?:%F{green}OK%f:%F{red}FAILED%f) %F{white}($?)%f
%F{blue}%~%f%F{red}%(1j. [%j].)%f $(git_prompt_info) %F{white}$(vi_mode_prompt_info)%f
'

RPROMPT=""
MODE_INDICATOR="-- NORMAL --"

# --------------------------------
# exports
# --------------------------------


# Better colors for fzf results
FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --color=light'

# QOL
workspace=$HOME/workspace
scratch=$workspace/scratch
tb=$scratch/tmpbuf


# CP utils
export CP_UTILS=$HOME/workspace/cs/cp/util
PATH=$PATH:$CP_UTILS/bin
export CPLUS_INCLUDE_PATH=$CP_UTILS/cpp

# Texlive
PATH=$PATH:$HOME/bin/texlive/bin/x86_64-linux

# Gems
PATH="$PATH:$HOME/gems/bin"

# --------------------------------
# aliases
# --------------------------------

alias py='python3'

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
source $ZDOTDIR/custom.zsh
source $ZDOTDIR/fsearch.zsh


