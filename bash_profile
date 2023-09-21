# kak:filetype=sh

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

if [ -f ~/.secrets ]; then
    source ~/.secrets
fi
