# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set Spaceship ZSH as a prompt
ZSH_THEME="spaceship"

# Enable autosuggestions (installed via Brew)
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Disable symbols
SPACESHIP_GIT_SYMBOL=""
SPACESHIP_GIT_BRANCH_PREFIX=""
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_NODE_SHOW=false
SPACESHIP_PHP_SHOW=false
SPACESHIP_BATTERY_SHOW=false

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git laravel5 composer osx)

source $ZSH/oh-my-zsh.sh

# Load z
. $HOME/.dotfiles/cli/z.sh

# Hide username in prompt
DEFAULT_USER=`whoami`

# Load the shell dotfiles, and then some:
# * ~/.extra can be used for other settings you don’t want to commit.
for file in $HOME/.dotfiles/cli/.{aliases,exports,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done

# Import ssh keys in keychain
ssh-add -A 2>/dev/null;

# Extra paths
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
