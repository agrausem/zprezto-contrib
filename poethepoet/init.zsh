# Activate poetry
#
if [[ -s "$HOME/.local/bin/poe" ]]; then
  fpath+="${0:h}/completion"
  echo $fpath
fi

