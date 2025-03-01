#!/bin/zsh

fvdirs=(
  "$HOME/workspace/setup"
  "$HOME/workspace/scratch"
)

# Fav dirs
fv_dirs() {
  local base_dir="$(printf '%s\n' ${fvdirs[@]} | fzf)"

  if [[ -n "$base_dir" ]]; then
    local target="$(find "$base_dir" -not -path "*/.git/*" -not -path "*/.git" | fzf)"
    if [[ -n "$target" ]]; then
      local pre_cursor="${BUFFER:0:$CURSOR}"
      local post_cursor="${BUFFER:$CURSOR}"
      BUFFER="$pre_cursor$target$post_cursor"
      CURSOR=$(( ${#pre_cursor} + ${#target} ))
    fi
  fi
  zle redisplay
}

zle -N fv_dirs
bindkey '^f' fv_dirs

