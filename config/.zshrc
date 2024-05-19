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
PROMPT='%(?:%F{green}OK%f:%F{red}FAILED%f) %F{white}($?)%f
%F{blue}%~%f $(git_prompt_info)'

