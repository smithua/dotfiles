# BUG FIX: tmuxinator mangles the $GEM_HOME environment variable. This is a quick and dirty fix.
# https://github.com/tmuxinator/tmuxinator/issues/841
unset GEM_HOME

# Set the path to Oh My Zsh.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load.
ZSH_THEME="landon"

# Oh My Zsh settings
DISABLE_UPDATE_PROMPT="true"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"

# Oh My Zsh plugins
plugins=(
  alias-finder
  brew
  bundler
  colored-man-pages
  command-not-found
  direnv
  docker
  docker-compose
  git
  github
  httpie
  iterm2
  kubectl
  node
  npm
  nvm
  macos
  postgres
  pyenv
  python
  rails
  rake
  rbenv
  ripgrep
  ruby
  tmux
  yarn
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Source Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Enable source highlighting in less.
export LESSOPEN="| $(brew --prefix)/bin/src-hilite-lesspipe.sh %s"
export LESS=" -R "

# Make bat readable on a light terminal.
export BAT_THEME="ansi-dark"

# Source the configuration files
for CONFIG_FILE in $HOME/.config/zsh/*; do
  source $CONFIG_FILE
done

# Disable autocorrect
unsetopt correct_all
