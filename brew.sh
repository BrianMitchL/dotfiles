#!/usr/bin/env bash

# ask for sudo access up front
sudo -v

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install command-line tools and cask applications using Homebrew.

brew tap homebrew/cask-fonts
brew tap yt-dlp/taps

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
if ! fgrep -q '/opt/homebrew/bin/zsh' /etc/shells; then
  echo '/opt/homebrew/bin/zsh' | sudo tee -a /etc/shells;
  chsh -s /opt/homebrew/bin/zsh;
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
brew install trash
brew install yt-dlp
brew install wget

# Install development environments
brew install node
brew install node@18

# Install Applications via cask
brew install --cask 1password
brew install --cask google-chrome
brew install --cask firefox
brew install --cask firefox-developer-edition
brew install --cask mactex
brew install --cask slack
brew install --cask textmate
brew install --cask transmission
brew install --cask transmit
brew install --cask vlc
brew install --cask xld
brew install --cask xquartz
brew install --cask fantastical
brew install --cask private-internet-access
brew install --cask appcleaner
brew install --cask bettertouchtool
brew install --cask coconutbattery
brew install --cask daisydisk
brew install --cask drivedx
brew install --cask keka
brew install --cask imageoptim
brew install --cask istumbler
brew install --cask pacifist
brew install --cask gpg-suite
brew install --cask screens
brew install --cask screens-connect
brew install --cask spotify
brew install --cask discord

# Remove outdated versions from the cellar.
brew cleanup

