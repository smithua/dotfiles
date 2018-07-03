# Dotfiles

This is a guide to setting up my personal development environment. It's meant get me up and running as fast as possible on a clean install of macOS.

## Prerequisites

Before anything else, install the system updates.

``` shell
softwareupdate -ia
```

Then, install Xcode and accept its license.

``` shell
xcode-select --install
sudo xcodebuild -license accept
```

## Dotfiles

The dotfiles in this repo are integrated with the [Thoughtbot dotfiles](https://github.com/thoughtbot/dotfiles). To get all of the settings and script files, you'll need to clone both repositories.

``` shell
git clone https://github.com/LandonSchropp/dotfiles $HOME/.dotfiles
git clone https://github.com/thoughtbot/dotfiles $HOME/.thoughtbot_dotfiles
```

[RCM](https://github.com/thoughtbot/rcm) is a handy utility to manage the linking of dotfiles. Most
of the applications and utilities (including Homebrew) can be installed by running the following
command.

``` shell
RCRC=$HOME/.dotfiles/rcrc rcup
```

This executes the [pre-up](hooks/pre-up-hooks) and [post-up](hooks/post-up-hooks) scripts, which
install applications and configure the system. These scripts are also idempotent, so feel free to
run the `rcup` command as many times as you'd like.

## Git

In order to connect with GitHub, you'll need to generate an SSH key. Follow the [instructions](https://help.github.com/articles/generating-an-ssh-key/) on Github.

## Node.js

These days, the best way to install node with with [NVM](https://github.com/creationix/nvm). To install it, follow the instructions in the [readme file](https://github.com/creationix/nvm#install-script).

Once NVM is installed, you'll want to install a global copy of Node.

``` shell
npm install stable
nvm use stable
```

## macOS

Mathias Bynens maintains [a script](https://mths.be/osx) that configures several macOS system and
application settings in one go. Because macOS is constantly updating, it's probably a good idea to
pull it down an modify every once in a while. My latest local iteration is kept in the
[macos.sh](macos.sh) script.

## Mackup

Mackup is used to back up all of the configuration files that aren't worth copying to this repository, such as tmuxinator's file or application configuration files. Once Dropbox has finished downloading all of your files, copy the application settings by running:

``` shell
mackup restore
```

## tmux

[tmux](https://tmux.github.io/) is a utility that allows you to run multiple windows inside one terminal.

First, install tmux with Homebrew.

``` shell
brew install tmux reattach-to-user-namespace
```

Next, install [tpm](https://github.com/tmux-plugins/tpm) and use it to install the tmux plugins.

``` shell
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
$HOME/.tmux/plugins/tpm/bin/install_plugins
```

[tmuxinator](https://github.com/aziz/tmuxinator) allows you to rapidly create tmux workspaces by storing their configurations in files. You can install tmuxinator by installing its gem.

``` shell
gem install tmuxinator
```

Once all of this is done, you may have to tell tmux to reload the configuration file.

``` shell
tmux source-file ~/.tmux.conf
```

## Fish

[Fish](https://fishshell.com/) is an awesome shell with a ton of useful features baked in out of the box.

To get up and running, install Fish and set it to the default shell.

``` shell
sudo bash -c 'echo "/usr/local/bin/fish" >> /etc/shells'
chsh -s /usr/local/bin/fish
```

Next, install [Fisherman](https://github.com/fisherman/fisherman) by following the instructions in
the readme. Finally, install the plugins.

``` shell
fisher
```

## Terminal Colors and Italics

To enable italic text in the terminal, you need to register italics with the TERM database.

```
tic $HOME/.dotfiles/xterm-256color-italic.terminfo
tic $HOME/.dotfiles/tmux-256color-italic.terminfo
```

Next, follow [these instructions](https://sunaku.github.io/tmux-24bit-color.html#usage) to get colors working in Tmux.

## PostgreSQL

[PostgreSQL](http://www.postgresql.org/) is an open-source SQL database and is installed via Homebrew. It can be started and stopped with the following commands:

```
brew services start postgresql
brew services stop postgresql
```
