#!/usr/bin/env bash

# Install command-line tools and cask applications using Homebrew.

tap 'caskroom/cask'
tap 'caskroom/fonts'

cask_args appdir: '~/Applications'

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion2

# Install zsh
# Note: don’t forget to add `/usr/local/bin/zsh` to `/etc/shells` before
# running `chsh`.
brew install zsh

# Switch to using brew-installed zsh as default shell
if ! fgrep -q '/usr/local/bin/zsh' /etc/shells; then
  echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/zsh;
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install curl

# Install other useful binaries.
brew install git
brew install imagemagick --with-webp
brew install ssh-copy-id
brew install tree
brew install nmap
brew install mas
brew install trash
brew install imagemagick --with-webp
brew install youtube-dl

# Install development environments
brew isntall node
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
brew cask install mactex
brew cask install pycharm
brew cask install slack
brew cask install textmate
brew cask install transmission
brew cask install transmit
brew cask install vlc
brew cask install webstorm
brew cask install xld
brew cask install zquartz

# Remove outdated versions from the cellar.
brew cleanup
