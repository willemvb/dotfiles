#!/usr/bin/env bash
echo 'Setting up terminal and installing packages…'

# Ask for the administrator password upfront
sudo -v

###############################################################################
# Install Oh-my-zsh                                                           #
###############################################################################

# Install zsh
echo 'Install oh-my-zsh'
rm -rf $HOME/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Symlink zsh prefs
ln -s -f $PWD/cli/.zshrc $HOME/.zshrc

# Install Spaceship theme
git clone git@github.com:denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# Sync iTerm2 preferences
# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.dotfiles/misc/iTerm2"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# Activate z
echo 'Install z'
chmod +x ./cli/z.sh

# Add gitconfig
echo 'Install git config'
ln -s -f $PWD/git/.gitconfig $HOME/.gitconfig

###############################################################################
# Install Brew packages                                                       #
###############################################################################

echo 'Install Homebrew'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew tap homebrew/services
brew doctor

echo 'Install wget'
brew install wget

echo 'Install PHP versions'
brew install php@7.2
brew install php@7.3
brew install php
brew services start php

echo 'Install ImageMagick'
brew install pkg-config imagemagick

echo 'Install Redis'
brew install redis

echo 'Install Node & Yarn'
brew install node
brew install yarn

echo 'Install mysql'
brew install mysql
brew services start mysql

echo 'Install zsh-autosuggestions'
brew install zsh-autosuggestions

echo 'Install Quicklook plugins'
brew cask install qlstephen

###############################################################################
# PHP extensions via PECL                                                     #
###############################################################################

echo 'Install Imagick'
pecl install imagick

echo 'Install Memcached'
pecl install memcached

echo 'Install Redis'
pecl install redis

###############################################################################
# Miscellaneous                                                               #
###############################################################################

echo 'Install other preferences'
# Add ignition
ln -s -f $PWD/misc/.ignition $HOME/.ignition

# Download fonts
echo 'Install IBM Plex'
wget "https://github.com/IBM/type/archive/master.zip"
unzip master.zip
rm master.zip
cp ./plex-master/IBM-Plex-Mono/**/*.otf $HOME/Library/fonts/
cp ./plex-master/IBM-Plex-Sans/**/*.otf $HOME/Library/fonts/
cp ./plex-master/IBM-Plex-Serif/**/*.otf $HOME/Library/fonts/
rm -rf plex-master


###############################################################################
# Install Composer                                                            #
###############################################################################

echo 'Install Composer'
brew install composer

echo 'Install Laravel Envoy'
composer global require laravel/envoy

echo 'Install Laravel Valet'
composer global require laravel/valet
valet install
mkdir $HOME/Sites
cd $HOME/Sites
valet park
cd $HOME

echo '😎 Done!'
