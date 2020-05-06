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

# Symlink iTerm2 settings
echo 'Install iTerm prefs'
ln -s -f $PWD/cli/com.googlecode.iterm2.plist $HOME/Library/Preferences/com.googlecode.iterm2.plist

# Activate z
echo 'Install z'
chmod +x ./cli/z.sh

###############################################################################
# Git config                                                                  #
###############################################################################

echo 'Install git preferences'
# Add global gitignore
ln -s -f $PWD/git/.global-gitignore $HOME/.global-gitignore

# Add gitconfig
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

echo 'Install Node & Yarn'
brew install node
brew install yarn

echo 'Install mysql'
brew install mysql
brew services start mysql

echo 'Install zsh-autosuggestions'
brew install zsh-autosuggestions

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
