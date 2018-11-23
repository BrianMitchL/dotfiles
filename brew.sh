#!/usr/bin/env bash

# Install command-line tools and cask applications using Homebrew.

brew tap caskroom/cask
brew tap caskroom/fonts

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion2

# Add `/usr/local/bin/bash` to `/etc/shells`
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
fi;

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

# Install `wget` with IRI support.
brew install wget

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
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
brew install thefuck

# Install development environments
brew install node
brew install ruby
brew install python3
brew install python@2

# Install mkvtoolnix with Qt GUI
brew install mkvtoolnix --with-qt

# Install Applications via cask
brew cask install 1password
brew cask install docker
brew cask install font-fira-code
brew cask install google-chrome
brew cask install firefox
brew cask install mactex
brew cask install pycharm
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

# Remove outdated versions from the cellar.
brew cleanup
