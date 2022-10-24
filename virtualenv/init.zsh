if [[ -f "$HOME/.local/bin/virtualenvwrapper.sh" ]]
then
	export VIRTUALENVWRAPPER_PYTHON=$(which python3)
	mkdir -p "$HOME/.virtualenvs"
	export WORKON_HOME="$HOME/.virtualenvs"
	source "$HOME/.local/bin/virtualenvwrapper.sh"
fi

