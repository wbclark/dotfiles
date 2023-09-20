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

twlp() {
    wl-paste | awk 'BEGIN{RS=ORS=""} {gsub(/^[[:space:]]+|[[:space:]]+$/, ""); print}'
}

wlp() {
    twlp
    printf '\n'
}

wlpn() {
    printf '\n'
    twlp
    printf '\n'
}

wlpnn() {
    printf '\n\n'
    twlp
    printf '\n'
}

lfzf () {
    local depth=1
    local path="$(pwd)"

    while [[ $# -gt 0 ]]; do
        case "$1" in
            -d)
                depth="$2"
                shift 2
                ;;
            -d[0-9]*)
                if [[ "$1" =~ -d([0-9]+) ]]; then
                    depth="${BASH_REMATCH[1]}"
                    shift
                fi
                ;;
            --depth)
                depth="$2"
                shift 2
                ;;
            *)
                path="$1"
                shift
                ;;
        esac
    done

    local abs_path="$(realpath $path)"

    locate --regex "^${abs_path}/([^/]+/?){1,$depth}$" | fzf
}
