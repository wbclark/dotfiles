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

wlp() {
    wl-paste | awk '
    BEGIN {
        trailing_empty_lines = 0;
        skip_leading_empty = 1;  # Initially set to skip leading empty lines
    }

    # Skip leading lines that are empty or contain only spaces/tabs
    skip_leading_empty && /^[\t ]*$/ { next }
    skip_leading_empty = 0  # Once the first non-empty line is encountered, set this to 0

    # For lines with non-whitespace characters
    /[^\t ]/ {
        # Print buffered trailing empty lines, if any
        for (i=0; i<trailing_empty_lines; i++) {
            print ""
        }
        trailing_empty_lines = 0  # Reset the counter

        sub(/[ \t]+$/, "");  # Remove trailing spaces/tabs
        print;
        next;
    }

    # For lines that are empty or contain only spaces/tabs
    /^[\t ]*$/ {
        trailing_empty_lines++  # Increment the counter for each such line
    }
    '
}

wlpn() {
    printf '\n'
    wlp
}

wlpnn() {
    printf '\n\n'
    wlp
}
