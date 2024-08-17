# Minimal version
# Full template: https://github.com/ohmyzsh/ohmyzsh/blob/master/templates/zshrc.zsh-template

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
  git
  fzf
  fzf-tab
)

source $ZSH/oh-my-zsh.sh

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
