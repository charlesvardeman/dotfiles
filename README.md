# Set of simple dotfiles

## Trust
I encourage you to have a look through the scripts in this repository before you run them. It is good practice not to run **_any_** scripts unless you have an understanding of what they are doing.
## Quickstart
This dotfiles repository uses [git to manage dotfiles](https://www.atlassian.com/git/tutorials/dotfiles) using a [Git bare repository](https://www.saintsjd.com/2011/01/what-is-a-bare-git-repository/) to manage the repo. Have a look at [Answer.ai's fastsetup](https://github.com/AnswerDotAI/fastsetup/tree/master) for bootstrapping a linux system.

### Fork the Dotfiles repository and clone the repository

It is **highly** recommended that you create your own copy of these dotfiles by [forking](https://docs.github.com/en/get-started/quickstart/fork-a-repo) the repository. This will allow you to create your own aliases and customize the dotfiles for different environments. After you have a fork of the repository, you can modify and track your own configuration.

### GitHub Setup

A convenient method for accessing git is through ssh instead of using the HTTPS interface. This involves generating a [ssh key pair](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) and [adding that key pair](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account) to your github account.

Generate ssh key pair for **this computer** replacing your email in the following command.

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

Copy the newly generated **public key** and [add to GitHub account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account).

```bash
pbcopy < ~/.ssh/id_ed25519.pub
```

When cloning from a github repository, select "ssh clone\* vs "HTTPS clone" from the dropdown. You can create a key pair for the cluster machines you will be doing development on. Jeremy Howard discusses [setting up ssh keys](https://youtu.be/0pWjZByJ3Lk?t=1455) and there is a [forum topic](https://forums.fast.ai/t/live-coding-2/96690).

### MacOS
My default system is MacOS, so these file are generally tuned and tested under the [MacOS Terminal](https://support.apple.com/guide/terminal/welcome/mac) for initial setup. I use [ghostty](https://ghostty.org/) post setup as my day-to-day terminal. 

#### Shell Stupidity
Note: The default shell on Linux (ubuntu and redhat) is generally bash, however the default shell on MacOS as of [MacOS Catalina is zsh](https://www.theverge.com/2019/6/4/18651872/apple-macos-catalina-zsh-bash-shell-replacement-features) likely due to licensing issues (GPLv2 vs GPLv3). Bash is still shipped with MacOS, but it is a very old version that may be problematic. You can figure out which shell you are running by running

On default MacOS you'll likely see:
```sh
$ echo $SHELL
/bin/zsh
```
On default linux:
On defalut you'll likely see:
```sh
$ echo $SHELL
/bin/bash
```

Zsh is a good modern shell, so it is not a bad choice. Most of this configuration will work with zsh as well as bash, since they have the same basic structure. However, I change my shell to modern version of bash using homebrew to reduce congnitive overhead and have a unified set of configurations accross machines. You can also fairly simply change the default shell in linux (and WSL) [](https://refine.dev/blog/zsh-vs-bash/#introduction), I just choose to avoid [Shell Holy Wars](https://news.ycombinator.com/item?id=33354800).

#### Shell Configuration files
I generally allow the .bashrc and .bash_profiles (and .zshrc, etc) to be local file that don't get placed in git control. My configuration is then stored in the .bashrc.local file and sourced by the .bashrc. The .bashrc file is in my `.gitignore` so I don't accidentally commit the file to git control. This let's me set environment variables and other sensitive aliases that shouldn't end up in github. Also, when you install some utility, it generally insists on messing with either your .zshrc or .bashrc and may cause issues if thoes files are used on other machines without those utilities installed. 

#### Setup Homebrew

If you are developing AI apps under MacOS (and Linux if you choose), [homebrew](https://brew.sh) is a convenient way to provide command line applications that are either older versions, or not provided in MacOS. To build software, homebrew requires that xcode command line tools be installed. The [free code camp](https://www.freecodecamp.org/news/install-xcode-command-line-tools/) has some extended instructions on how to do this. You can do this from the mac terminal

```bash
xcode-select --install
```

and then install homebrew using the homepage instructions:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
The install will add the homebrew PATH to you shell path, so by default that path will end up in your .zshrc. Restart your terminal and type the follwing shell to make sure all is good with the install.
```sh
$ brew --version
Homebrew 4.4.22
``

#### Switch to bash
Once homebrew is installed, you can change shells to bash if you want. There are two options
1. Stick with the default version of the older bash that comes with MacOS. From the command line
```sh
chsh -s /bin/bash
```
You'll have to enter your user account's password. Finally, close the Terminal window and reopen it. You'll be using Bash instead of Zsh. However, there will be a nag in terminal window telling you that you are not doing things the "Apple way" and should be using zsh. To turn off the nag.

```sh
echo 'export BASH_SILENCE_DEPRECATION_WARNING=1' >> ~/.bashrc
```

2. Install bash from homebrew.
```sh
brew install bash
```
After installation, verify the installed Bash version:
```sh
brew list bash
bash --version
```
MacOS uses a whitelist of allowed shells stored in /etc/shells. You need to add the new Bash path to this file.
```sh
which bash
```
This should output something like:
```sh
/opt/homebrew/bin/bash   # (For Apple Silicon - M1/M2/M3)
/usr/local/bin/bash       # (For Intel Macs)
```
Append this path to /etc/shells:
```sh
echo "/opt/homebrew/bin/bash" | sudo tee -a /etc/shells
```
(Use /usr/local/bin/bash for Intel Macs.)

Now, change your default shell to the newly installed Bash:
```sh
chsh -s /opt/homebrew/bin/bash
```
(Use /usr/local/bin/bash for Intel Macs.)

Close and reopen your terminal or restart your Mac, then verify that the new Bash is your default shell:
```sh
echo $SHELL
bash --version
GNU bash, version 5.2.37(1)-release (aarch64-apple-darwin23.4.0)
```
It  should be version later than 5.2.x.

To revert to a different shell.
```
chsh -s /bin/zsh
```

**Why a Restart May Be Required**

After changing the default shell with chsh -s, macOS may not immediately recognize the update in Terminal, especially if the app was open during the change. While opening a new terminal session usually applies the change, some users may need to fully restart their Mac for the new shell to take effect.

If you still see the old shell after changing it, try running:
```sh
exec $SHELL -l
```
or manually launching the new Bash with:
```sh
/opt/homebrew/bin/bash
```
If issues persist, ensure the correct shell path is listed in /etc/shells and rerun chsh -s. A restart should finalize the switch.

#### Minimal Homebrew Packages
My dotfiles require some packages in addition to to be installed from homebrew.

Minimal required installs
```sh
brew install uv
brew install gh
brew install tmux
brew install universal-ctags
```

Nice to haves:
```sh
brew install bat
brew install curl
brew install wget
brew install exa
brew install fzf
brew install jq
brew install ripgrep
```

In addition, if you are using [nbdev](https://nbdev.fast.ai/) for development, you can install [quarto](https://quarto.org/) via cask:
```
brew install --cask quarto
```
Quarto is very useful for using Jupyter notebooks as the basis for doing science and lowering the barriers to publications using [scientific markdown](https://quarto.org/docs/authoring/markdown-basics.html).

I generally let brew manage the MacOS apps like vscode also:
```sh
brew install --cask docker
brew install --cask slack
brew install --cask zoom
brew install --cask visual-studio-code
brew install --cask ghostty
brew install --cask xquartz
```


#### Clone the Github Repository

#### Add .bashrc.local to your .bashrc

### Linux

### WSL (ToDo)

### Python package management with uv
I use [uv](https://github.com/astral-sh/uv), "An extremely fast Python package and project manager, written in Rust." for managing project based python dependencies, python versions and python baed tools. In my current workflow, I install uv via homebrew on MacOS and via command line on linux because of historical reasons. Simon Willison has many nice [examples](https://simonwillison.net/tags/uv/) on his [weblog](https://simonwillison.net/) on why uv is a good approach to package management. This installs to the .local path following the [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/latest/).

```
# On macOS and Linux.
curl -LsSf https://astral.sh/uv/install.sh | sh
```


### Shell-Sage
As my command-line AI copilot I use [Answer.ai ShellSage](https://ssage.answer.ai/) which operates in a [Tmux](https://www.redhat.com/en/blog/introduction-tmux-linux) environment to give context to the LLM. Shell-sage can be configured to use Anthropic Claude (what I use) or OpenAI models. My ShellSage configuration is in .config repo and will be installed in the proper [XDG_CONFIG_HOME](https://specifications.freedesktop.org/basedir-spec/latest/). I install shell-sage via uv as a tool

```sh
uv tool install shell_sage
```

And then define an alias and export the anthropic key in my `.bashrc`.
```sh
alias ssage="uv tool run ssage"
```

Since my `.bashrc` is in a .gitignore, I don't worry about accidentally commiting a sensitive api key to my github repository. 



### Config files in this repo.
Contents:
- .config/ - XDG directory Contains configuration files for specific applications like shell-sage and Ghostty
- .ackrc - Configuration file for ack, a grep-like text finder.
-	.bash_aliases - Custom shell aliases for more efficient command-line usage.
-	.bashrc.local & .bashrc.mac - Custom Bash configurations for different environments.
-	.ctags - Configuration for ctags, used for code navigation.
-	.gitignore - Defines ignored files in Git repositories.
-	.tmux.conf - Configuration file for tmux, enhancing terminal multiplexing.
-	.vimrc - Custom configurations for vim, enhancing editing experience.


## Motivation

This is a set of dotfiles based loosely on the set of [fastai dotfiles](https://github.com/fastai/dotfiles). 
It is recommended that Windows users use [Windows Subsystem for Linux (WSL)](https://learn.microsoft.com/en-us/windows/wsl/install) that will give you a linux environment where you can then use this set of dotfiles. In this setup, the bash shell environment is mainly for linux where bash tends to be the default shell. The zsh shell does try to install some plugins, but is still fairly light weight.

Like the fastai version, this set of dotfiles is based on using [git to manage dotfiles](https://www.atlassian.com/git/tutorials/dotfiles) using a [Git bare repository](https://www.saintsjd.com/2011/01/what-is-a-bare-git-repository/). It includes simple configurations for vim, zsh, git, ctags.

Jeremy Howard as a set of [youtube live coding videos](https://www.youtube.com/watch?v=56sIyFjihEc&list=PLfYUBJiXbdtSLBPJ1GMx-sQWf6iNhb8mM) where he shows how to setup a machine learning environment in different contexts. There is [forum discussion](https://forums.fast.ai/t/live-coding-aka-walk-thrus/96617) on each of the videos that gives more detail on the setup. If you are setting up a Linux machine or VM, [Answer.ai's fastsetup](https://github.com/AnswerDotAI/fastsetup/tree/master).
