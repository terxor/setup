source $ZDOTDIR/custom_pre.zsh
# --------------------------------
export PATH="$HOME/.local/bin:$PATH"
export EDITOR=nvim

# QOL
export workspace=$HOME/workspace
export scratch=$workspace/scratch
export tb=$scratch/tmpbuf

# --------------------------------
# oh-my-zsh
# --------------------------------
ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
ZSH_TMUX_AUTOSTART=true

DISABLE_AUTO_UPDATE=true
zstyle ':omz:update' mode disabled

plugins=(
  vi-mode # always keep first, otherwise it breaks fzf and fzf-tab
  git
  fzf
  fzf-tab
  tmux
)

source $ZSH/oh-my-zsh.sh

# --------------------------------
# general
# --------------------------------

bindkey '^P' push-line
bindkey '^H' clear-screen

setopt magic_equal_subst

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
    dir=$1
    shift
    $EDITOR "+cd $dir" "$@"
  else
    $EDITOR "$@"
  fi
}

source $ZDOTDIR/fv.zsh
source $ZDOTDIR/custom_post.zsh

# --------------------------------
# standard utils lib
# --------------------------------
if [[ -d "$HOME/workspace/utils/py" ]]; then
  export PYTHONPATH="${PYTHONPATH:+$PYTHONPATH:}$HOME/workspace/utils/py"
fi
