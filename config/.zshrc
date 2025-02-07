# Minimal version
# Full template: https://github.com/ohmyzsh/ohmyzsh/blob/master/templates/zshrc.zsh-template

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
  vi-mode # always keep first, otherwise it breaks fzf and fzf-tab
  git
  fzf
  fzf-tab
)

source $ZSH/oh-my-zsh.sh

bindkey -M vicmd ';'  end-of-line
bindkey -M viins 'kj' vi-cmd-mode
bindkey -M vicmd 'kj' vi-cmd-mode # basically no-op

alias zshconfig="source ~/.zshrc"

# There is a newline in the prompt
# The j part shows number of suspended jobs
PROMPT='%(?:%F{green}OK%f:%F{red}FAILED%f) %F{white}($?)%f
%F{blue}%~%f%F{red}%(1j. [%j].)%f $(git_prompt_info)'

# git diff aliases to pipe to ydiff
alias gd="git diff | ydiff -s"
alias gds="git diff --staged | ydiff -s"

# git status of multiple repositories under a dir
alias gitstat='find . -maxdepth 1 -mindepth 1 -type d -exec sh -c "(echo {} && cd {} && git status -s && echo)" \;'

# Only auto-start tmux if:
# 1. The shell is interactive.
# 2. You are not already inside a tmux session.
# 3. No command was passed to the shell.
if [[ $- == *i* ]] && [ -z "$TMUX" ] && [ $# -eq 0 ]; then
    tmux attach -t default || tmux new -s default
fi
