# show git branch
parse_git_branch() {
	git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h: \[\033[01;34m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "

# If xterm or rxvt, set the title to dir
case "$TERM" in
xterm* | rxvt* | alacritty*)
	PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'

	# Show the currently running command in the terminal title:
	# http://www.davidpashley.com/articles/xterm-titles-with-bash.html
	show_command_in_title_bar() {
		case "$BASH_COMMAND" in
		*\033]0*)
			# The command is trying to set the title bar as well;
			# this is most likely the execution of $PROMPT_COMMAND.
			# In any case nested escapes confuse the terminal, so don't
			# output them.
			;;
		*)
			echo -ne "\033]0;${USER}@${HOSTNAME}: ${BASH_COMMAND}\007"
			;;
		esac
	}
	trap show_command_in_title_bar DEBUG
	;;
*) ;;
esac

# lock screen command
alias lock="xset dpms force standby"

# Text editor
alias vim=nvim
export EDITOR=nvim

# Terminal emulator
export TERM=alacritty
