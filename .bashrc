#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -al'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

function clamscan {
    sudo sh -c "nohup nice -20 clamscan -i -v --log=/root/clamscan.log --move=/root/INFECTED -r '$1' >/root/clam.out 2>&1 &"
}

