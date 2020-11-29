#!/usr/bin/env bash

# ask for sudo access up front
sudo -v

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install command-line tools and cask applications using Homebrew.

brew tap homebrew/cask
brew tap homebrew/cask-fonts
brew tap mas-cli/tap

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install zsh
# Note: don’t forget to add `/usr/local/bin/zsh` to `/etc/shells` before
# running `chsh`.
brew install zsh

# Add `/usr/local/bin/zsh` to `/etc/shells`
# Switch to using brew-installed zsh as default shell
if ! fgrep -q '/usr/local/bin/zsh' /etc/shells; then
  echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/zsh;
fi;

brew install starship

# Install more recent versions of some macOS tools.
brew install vim
brew install grep
brew install openssh
brew install curl

# Install other useful binaries.
brew install git
brew install imagemagick
brew install ssh-copy-id
brew install tree
brew install nmap
brew install mas
brew install trash
brew install youtube-dl
brew install wget

# Install development environments
brew install node
brew install node@14
brew install ruby
brew install python

# Install Applications via cask
brew cask install 1password
brew cask install docker
brew cask install font-fira-code
brew cask install google-chrome
brew cask install firefox
brew cask install firefox-developer-edition
brew cask install mactex
brew cask install slack
brew cask install textmate
brew cask install transmission
brew cask install transmit
brew cask install vlc
brew cask install webstorm
brew cask install xld
brew cask install xquartz
brew cask install fantastical
brew cask install private-internet-access
brew cask install appcleaner
brew cask install bettertouchtool
brew cask install coconutbattery
brew cask install daisydisk
brew cask install drivedx
brew cask install intel-power-gadget
brew cask install keka
brew cask install gitup
brew cask install imageoptim
brew cask install istumbler
brew cask install pacifist
brew cask install gpg-suite
brew cask install screens
brew cask install screens-connect
brew cask install spotify
brew cask install discord

# Remove outdated versions from the cellar.
brew cleanup

