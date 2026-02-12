commit () { git commit -am "${1}" && git push; }
fixes () { git commit -am "fixes #${1}" && git push; }

alias a=alias


alias issues="gh issue list"
alias issue="gh issue create"
alias enhancement="gh issue create -l enhancement -b '' -t"
alias bug="gh issue create -l bug -b '' -t"
alias breaking="gh issue create -l breaking -b '' -t"
# a note="gh issue -R charlesvardeman/notes create"

alias gitssh="perl -pi -e 's#https://github\.com/#git\@github.com:# if /\[remote \"origin/../fetch =/' .git/config"

# a minst="mamba install -c defaults"

alias grep='grep  --color=auto --exclude-dir={.git}'
alias ll='ls -lrth'
alias la='ls -lrthA'
alias l='ls -CF'
alias tmux="tmux -u"

# View syntax-highlighted files in the current directory, live-filtered by fzf.
alias v='fzf --preview "bat --color \"always\" --theme GitHub {}"'

# Save three keystrokes to go up a directory
alias ..="cd .."

alias cv="cd $HOME/dev/git/charlesvardeman"
alias la3d="cd $HOME/dev/git/LA3D"
alias crc=" cd $HOME/dev/git/crcresearch"
alias cwo='CLAUDE_CODE_ADDITIONAL_DIRECTORIES_CLAUDE_MD=1 claude --add-dir ~/Obsidian/obsidian'
