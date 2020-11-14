#!/usr/bin/env zsh

if ! [ -x "$(command -v brew)" ]; then
  echo '========== Installing Homebrew =========='
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
  echo "========== Update Homebrew ========="
  brew update
fi

declare -a cliApps=(
  'asdf'                  # Extendable version manager with support for Ruby, Node.js, Elixir, Erlang & more
  'bat'
  'cmake'
  'curl'
  'exa'
  'fasd'
  'exa'
  'graphviz'
  'helm'
  'jq'
  'readline'
  'graphviz'
  'fd'
  'raptor'
  'pwgen'
  'ripgrep'
  'fzf'                   # A command-line fuzzy finder
  'git'                   # update system git with latest version
  'hubflow'              # Tool for gitflow branching model
  'htop'                  # htop is an interactive text-mode process viewer for Unix systems. It aims to be a better 'top'.
  'libpq'                 # programming interface for postgresql
  'maven'                 # Java build tool
  'miller'
  'neovim'                # Drop-in replacement for Vim
  'pandoc'
  'socat'
  'serd'                  # RDF library written in C
  'terminal-notifier'     # command-line tool to send macOS user notifications
  'the_silver_searcher'   # A code-searching tool similar to ack, but faster ag command used in Vim / CLI
  'tmux'
  'tree'
  'tmuxinator-completion'
  'truncate'              # The truncate utility adjusts the length of	each regular file given	on the command-line
  'typescript'
  'watch'
  'watchman'
  'wget'
  'vcsh'                  # config manager based on Git
  'yq'
  'yarn'                  # Fast, reliable, and secure dependency management.
)

echo '========== Installing CLI apps =========='
for app in "${cliApps[@]}"
do
  brew install $app
done



echo '========== Upgrading CLI apps =========='
brew upgrade

echo '========== Tap fonts caskroom'
brew tap homebrew/cask-fonts
# ulysses
# pages
# endpoint security vpn
declare -a guiApps=(
  'basictex'
  'docker-edge'              # Containerize, but not all things
  'drawio'
  'firefox'                  # Using firefox as default browser
  'font-firacode-nerd-font'  # Currently using this patched font in vim. Includes icons
  'font-firacode-nerd-font-mono'
  'font-ibm-plex'
  'font-iosevka'
  'font-iosevka-nerd-font'
  'font-iosevka-nerd-font-mono'
  'font-iosevka-slab'
  'font-meslo-lg-nerd-font'
  'google-chrome'
  'google-backup-and-sync'
  'iterm2'                   # Iterm2 is so much better than macOS Terminal
  'postman'                  # Postman for API development
  'slack'
  'visual-studio-code'
  'zoom'
)


echo '========== Installing GUI apps =========='
for app in "${guiApps[@]}"
do
  brew cask install $app
done

echo '========== Cleanup brew installation =========='
brew cleanup

echo '========== Install Java and homebrew depending on Java
brew cask install java
brew install jena
brew cask install protege


echo '========== Install ZSH4Humans =========='
if command -v curl >/dev/null 2>&1; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
else
  sh -c "$(wget -O- https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
fi

# echo '========== Set default shell to zsh =========='
# sudo /usr/bin/env zsh -c 'grep -qxF /usr/local/bin/zsh /etc/shells || echo /usr/local/bin/zsh >> /etc/shells'
# chsh -s /usr/local/bin/zsh

# echo '========== Installing powerlevel10 theme =========='
#if [ -d "${ZSH_CUSTOM}/themes/powerlevel10k" ]; then
#  echo ' ---- update powerlevel10k theme'
#  cd "${ZSH_CUSTOM}/themes/powerlevel10k"
#  git pull
#  cd $HOME
# else
#  echo ' ---- install powerlevel10k theme'
#  git clone https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM}/themes/powerlevel10k"



# Test is vcsh repos are present, else do not install them
#echo '========== Installing dotfiles =========='
#cd $HOME
#if [ -d "${HOME}/.config/vcsh/repo.d/sdot.git" ]; then
#  echo ' ---- sdot already installed'
#else
#  echo ' ---- install sdot'
#  vcsh init sdot
#  vcsh sdot remote add origin 'keybase://private/michaelrigart/dotfiles'
#  vcsh sdot branch --set-upstream-to=origin/master master
#  vcsh sdot pull
#fi

#if [ -d "${HOME}/.config/vcsh/repo.d/dot.git" ]; then
#  echo ' ---- dot already installed'
#else
#  echo ' ---- install dot'
#  vcsh init dot
#  vcsh dot remote add origin 'git@github.com:michaelrigart/dotfiles.git'
#  vcsh dot branch --set-upstream-to=origin/master master
#  vcsh dot pull
#fi

# echo '========== Resource zsh profile =========='
# source $HOME/.zshrc


echo '========== Add ASDF Python plugin =========='
asdf plugin-add python


echo '========== Install Python 3.8.0 =========='
asdf install python 3.8.5

echo '========== Set default python version to 3.8.0 =========='
asdf global python 3.8.5

echo '========== Update Pip =========='
pip install --upgrade pip


echo '========== Add ASDF Golang plugin =========='
asdf plugin-add golang

echo '========== Install latest golang  =========='
asdf install golang latest

echo '========== Add ASDF node plugin    =========='
asdf plugin add nodejs

echo '========== Install latest node   ==========='

echo '========== Create cache directories =========='
mkdir -p "${XDG_CACHE_HOME}/irb"

