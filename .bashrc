# .bashrc

# Custom Prompt
PS1='\[\e[0;92m\]\u \[\e[0;96m\]\W \[\e[0m\]➤ \[\e[0m\] '

# Aliases
alias hg='history | grep'
alias ll='ls -al'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc
