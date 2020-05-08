# Willem's dotfiles

### Pre-requisites
Install…
- 1Password
- SSH RSA keys
- Vscode
- iTerm2
- Xcode CLI Tools

```bash
xcode-select --install
```

### Installation

Clone this repo and install all the things!

```bash
cd ~
git clone git@github.com:willemvb/dotfiles.git .dotfiles
cd .dotfiles
source ./install.sh
```

### Setup maOS defaults

```bash
source ./macos.sh
```

Most application settings are synced via iCloud. Exceptions:

- VS Code: https://marketplace.visualstudio.com/items/Shan.code-settings-sync
- iTerm2 via these dotfiles

Additionaly, search and install in the VS Code Command Palette the shell command `code`.


### Thanks to…

- [Matthias Bynens](https://github.com/mathiasbynens/dotfiles)
- [Freek Van der Herten](https://github.com/freekmurze/dotfiles)
