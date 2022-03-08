function move_to() {
    cd ~/Documents/$1
}

alias ag="ag --ignore .venv"
alias g="git"
alias flush="sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper;sudo dscacheutil -flushcache"
alias kctl="kubectl"
alias m=move_to
alias v="vim"
