commit () { git commit -am "${1}" && git push; }
fixes () { git commit -am "fixes #${1}" && git push; }

alias a=alias


a issues="gh issue list"
a issue="gh issue create"
a enhancement="gh issue create -l enhancement -b '' -t"
a bug="gh issue create -l bug -b '' -t"
a breaking="gh issue create -l breaking -b '' -t"
a note="gh issue -R jph00/notes create"

alias gitssh="perl -pi -e 's#https://github\.com/#git\@github.com:# if /\[remote \"origin/../fetch =/' .git/config"

a minst="mamba install -c defaults"

a grep='grep  --color=auto --exclude-dir={.git}'
a ll='ls -lrth'
a la='ls -lrthA'
a l='ls -CF'
a tmux="tmux -u"

# View syntax-highlighted files in the current directory, live-filtered by fzf.
a v='fzf --preview "bat --color \"always\" --theme GitHub {}"'

# Save three keystrokes to go up a directory
alias ..="cd .."
