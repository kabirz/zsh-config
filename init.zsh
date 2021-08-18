# Command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias -- -='cd -'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

alias md='mkdir -p'
alias rd=rmdir

# List directory contents
alias -g P="2>&1| pygmentize -l pytb"

#read documents
alias -s pdf=acroread
alias -s ps=gv
alias -s dvi=xdvi
alias -s chm=xchm
alias -s djvu=djview

#list whats inside packed file
alias -s zip="unzip -l"
alias -s rar="unrar l"
alias -s tar="tar tf"
alias -s tar.gz="echo "
alias -s ace="unace l"

# tmux
alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'

alias ra=ranger
alias s=neofetch
alias lg=lazygit
if [ "$(command -v exa)" ]; then
    unalias -m 'll'
    unalias -m 'l'
    unalias -m 'ls'
    alias ls='exa --color auto --icons -s type'
    alias ll='exa -l --color always --icons -s type'
		alias l='exa -lFh'
    alias la='exa -laFh'
else
    alias la='ls -lAFh'
fi
if [ "$(command -v bat)" ]; then
    alias cat='bat -pp --theme Dracula'
fi

[ -d ~/.local/bin ] && PATH=~/.local/bin:$PATH
[ -d ~/.cargo/bin ] && PATH=~/.cargo/bin:$PATH

# for fzf
[[ -e /usr/share/fzf/completion.zsh ]] && source /usr/share/fzf/completion.zsh
[[ -e /usr/share/fzf/key-bindings.zsh ]] && source /usr/share/fzf/key-bindings.zsh
[[ -e /usr/share/doc/fzf/examples/completion.zsh ]] && source /usr/share/doc/fzf/examples/completion.zsh
[[ -e /usr/share/doc/fzf/examples/key-bindings.zsh ]] && source /usr/share/doc/fzf/examples/key-bindings.zsh

export EDITOR=nvim

#mirros for rust
export RUSTUP_DIST_SERVER=http://mirrors.ustc.edu.cn/rust-static
export RUSTUP_UPDATE_ROOT=http://mirrors.ustc.edu.cn/rust-static/rustup
# proxy for golang
# export GOPROXY=https://mirrors.aliyun.com/goproxy
# replace by command: go env -w GOPROXY=https://goproxy.cn
