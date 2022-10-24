# Activate poetry
#
if [[ -d "$HOME/.poetry/bin" ]]; then
  export PATH="$HOME/.poetry/bin:$PATH"
  fpath+="${0:h}/completion"
fi

