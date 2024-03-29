# kak:filetype=sh

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

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

export EDITOR='kak'
export VISUAL='kak'

unset rc

alias filteredlogs="sudo journalctl -f | awk '!(/slack\[.*\]: \[.*\] info:/)'"

alias rhvpn='nmcli --ask con up id "1 - Red Hat Global VPN"'
