if [[ -d "$HOME/.pyenv" ]]
then
	export PYENV_ROOT="$HOME/.pyenv"
	command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
	eval "$(pyenv init -)"
	eval "$(pyenv virtualenv-init -)"
fi


if [[ -f "$HOME/.local/bin/virtualenvwrapper.sh" ]]
then
	export VIRTUALENVWRAPPER_PYTHON=$(which python3)
	mkdir -p "$HOME/.virtualenvs"
	export WORKON_HOME="$HOME/.virtualenvs"
	source "$HOME/.local/bin/virtualenvwrapper.sh"
fi

