# Macbook Pro Setup 12-2024

Basic setup of Macbook for 2024.
- Based on [My Minimal MacBook Pro Setup Guide](https://eugeneyan.com/writing/mac-setup/)

## Changes from previous setup.
Previous dotfiles relied on conda and miniconda for providing python environments. The new dotfile shift to using uv to manage python environments for development.

## Basic Developer Setup

- **Xcode Developer Tools**

```
xcode-select --install
```

- **Homebrew** (essential setup for everything else)

```
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# add brew to default shell path
echo >> /Users/cvardema/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/cvardema/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# check for updates
brew update
```
- **Terminal:** Generally use built in mac terminal, however it has not been updated in a long while. The new AI driven terminal is [Warp](https://www.warp.dev/).

```
brew install --cask warp
brew install --cask font-inconsolata-for-powerline
brew install --cask font-cascadia-code
brew install --cask font-fira-code
brew install --cask font-iosevka-nerd-font
brew install --cask font-monaspace
brew install --cask font-meslo-lg-nerd-font
```

- **Terminal:** Kids these days seem to be using alacritty, but JH is alos using [Ghostty](https://mitchellh.com/writing/ghostty-is-coming)
```
brew install --cask alacritty
```

- **Shell:** Trying Fish

```
  brew install fish
# make fish default shell
echo $(which fish) | sudo tee -a /etc/shells
chsh -s $(which fish)

# add brew to fish path
echo >> /Users/cvardema/.config/fish/config.fish
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/cvardema/.config/fish/config.fish
eval "$(/opt/homebrew/bin/brew shellenv)"
```

- **Docker:** We need docker be able to run docker containers for a bunch of tasks

```
brew install --cask docker
```

- htop and asitop install

```
brew install htop
brew install asitop
```

- **New ssh keys**

```
ssh-keygen -t ed25519 -C "your_email@example.com"

eval "$(ssh-agent -s)"
touch ~/.ssh/config
open ~/.ssh/config

# add to config
Host github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
```
Also see the Github docs to generate a [new ssh key and add to ssh agent](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent), and [add a new ssh key to Github account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account).

- **Git**
```
brew install git
brew install git-lfs
brew install gh
git config --global core.editor "nano"
git config --global init.defaultBranch main
git config --global user.name "CharlesVardeman"
git config --global user.email charles.vardeman@gmail.com
```
- **Tmux:**
```
brew install tmux
```

- **General Utils and Command Replacements**
```
brew install bat
brew install fzf
brew install ripgrep
brew install tree
brew install wget
brew install jq
```

- **Install DVC**
```
brew install dvc
```

## Research, writing, development

- **Zotero:**

```
brew install --cask zotero
# enable zotero plugin in safari
```

- **Chrome:**

```
brew install --cask google-chrome
```

- **Quarto**
```
brew install --cask quarto
```

- **Python, JS**

```
# very fast python package manager
brew install uv

# install the latest python
uv python install 3.12
```

```
brew install node
brew install nvm

# still deciding between pnpm and bun
brew install pnpm
brew install oven-sh/bun/bun
```

```
brew install cmake
```
- Modular Mojo
```
brew install modularml/packages/modular
modular install mojo
```

- **Semantic Web**
```
brew install jena
brew install --cask protege
```
- **Visual Studio Code**
```
brew install --cask visual-studio-code
```

## Productivity and quality of life

- **Raycast:** A better spotlight
```
brew install --cask raycast
```

- **Google Drive:** Syncing documents, files, media, etc.
```
brew install --cask google-drive
```
- **Stats + Ice:** Adding system stats to menu bar and customizing the menu bar
```
brew install stats
brew install jordanbaird-ice
```

## Entertainment and communications

- **Media**
```
brew install --cask vlc
```
- **Chat**
```
brew install --cask discord
brew install --cask slack
```
- **Zoom**
```
brew install --cask zoom
```

