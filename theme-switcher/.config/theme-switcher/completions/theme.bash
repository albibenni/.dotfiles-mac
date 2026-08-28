# Bash completion for the theme switcher.

_theme_switcher() {
	local current command themes
	current="${COMP_WORDS[COMP_CWORD]}"
	command="${COMP_WORDS[1]:-}"

	if (( COMP_CWORD == 1 )); then
		COMPREPLY=( $(compgen -W 'list current borders validate set' -- "$current") )
		return
	fi

	case "$command" in
		set|validate)
			themes=$(command theme list 2>/dev/null)
			COMPREPLY=( $(compgen -W "$themes" -- "$current") )
			;;
		esac
}

complete -F _theme_switcher theme
