# Zsh completion for the theme switcher.

_theme_switcher() {
	local -a commands themes

	commands=(
		'list:show available themes'
		'current:show the active theme'
		'borders:apply the current theme border color'
		'validate:validate a theme name'
		'set:apply a theme'
	)

	if (( CURRENT == 2 )); then
		_describe -t commands 'theme command' commands
		return
	fi

	if (( CURRENT == 3 )) && [[ "$words[2]" == set || "$words[2]" == validate ]]; then
		themes=("${(@f)$(command theme list 2>/dev/null)}")
		_describe -t themes 'theme' themes
	fi
}

compdef _theme_switcher theme
