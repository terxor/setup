PATH="$HOME/.local/bin:$PATH"
EDITOR=nvim

# QOL
workspace=$HOME/workspace
scratch=$workspace/scratch
tb=$scratch/tmpbuf

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
# Better colors for fzf results
FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --color=light'

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

# vim wrapper
v() {
  if [[ -d "$1" ]]; then
    $EDITOR "+cd $1"
  else
    $EDITOR "$@"
  fi
}

source $ZDOTDIR/fsearch.zsh
source $ZDOTDIR/custom.zsh


