# ls, the common ones I use a lot shortened for rapid fire usage
alias ls='ls --color' # ls color
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls -l'      #long list
alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'

alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

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

# sudo
sudo-command-line() {
    [[ -z $BUFFER ]] && LBUFFER="$(fc -ln -1)"
    if [[ -n $EDITOR && $BUFFER == $EDITOR\ * ]]; then
        if [[ ${#LBUFFER} -le ${#EDITOR} ]]; then
            RBUFFER=" ${BUFFER#$EDITOR }"
            LBUFFER="sudoedit"
        else
            LBUFFER="sudoedit ${LBUFFER#$EDITOR }"
        fi
    elif [[ $BUFFER == sudoedit\ * ]]; then
        if [[ ${#LBUFFER} -le 8 ]]; then
            RBUFFER=" ${BUFFER#sudoedit }"
            LBUFFER="$EDITOR"
        else
            LBUFFER="$EDITOR ${LBUFFER#sudoedit }"
        fi
    elif [[ $BUFFER == sudo\ * ]]; then
        if [[ ${#LBUFFER} -le 4 ]]; then
            RBUFFER="${BUFFER#sudo }"
            LBUFFER=""
        else
            LBUFFER="${LBUFFER#sudo }"
        fi
    else
        LBUFFER="sudo $LBUFFER"
    fi
}
zle -N sudo-command-line
# Defined shortcut keys: [Esc] [Esc]
bindkey -M emacs '\e\e' sudo-command-line
bindkey -M vicmd '\e\e' sudo-command-line
bindkey -M viins '\e\e' sudo-command-line

[ -d ~/.local/bin ] && PATH=~/.local/bin:$PATH
[ -d ~/.cargo/bin ] && PATH=~/.cargo/bin:$PATH
[[ -e /etc/zsh_command_not_found ]] && source /etc/zsh_command_not_found
[[ -e /usr/share/doc/pkgfile/command-not-found.zsh ]] && source /usr/share/doc/pkgfile/command-not-found.zsh

# for fzf
[[ -e /usr/share/fzf/completion.zsh ]] && source /usr/share/fzf/completion.zsh
[[ -e /usr/share/fzf/key-bindings.zsh ]] && source /usr/share/fzf/key-bindings.zsh

export EDITOR=nvim

export RUSTUP_DIST_SERVER=http://mirrors.ustc.edu.cn/rust-static
export RUSTUP_UPDATE_ROOT=http://mirrors.ustc.edu.cn/rust-static/rustup
