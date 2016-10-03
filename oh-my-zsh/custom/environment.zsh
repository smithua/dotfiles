# set the default text editor
export EDITOR="nvim"

# set up the local bin paths
export PATH="./bin:./node_modules/.bin:/usr/local/heroku/bin:$PATH"

# Remove the delay when hitting the escape key
export KEYTIMEOUT=1

# Configure cd paths
setopt auto_cd
cdpath=($HOME $HOME/Development)

# Prevent Zsh from exiting the shell when Control-D is pressed
set -o ignoreeof

# Enable source highlighting in less
export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS=" -R "
