export ANDROID_HOME=/home/julien/Android/Sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export PATH=${PATH}:$HOME/bin

export JAVA_HOME=/usr/lib/jvm/java-8-oracle/
export PATH=$PATH:/usr/local/go/bin

export EDITOR=nvim
export SSH_KEY_PATH="~/.ssh/rsa_id"

export PATH=$PATH:~/scripts

# == ZSH specific
plugins=(git)

export ZSH=~/".oh-my-zsh"

DEFAULT_USER="$(whoami)"
ZSH_THEME="agnoster"

source $ZSH/oh-my-zsh.sh

prompt_dir() {                                                              
   prompt_segment blue black '%1d'
}  

# == Rust
source $HOME/.cargo/env

# == Disable ctrl-s to enable it in nvim
stty start undef
stty stop undef
setopt noflowcontrol

# == Aliases
# alias dev=@See scripts/dev
alias redev='tmux at -t'
alias killdev='tmux kill-session -t'
alias weather='curl wttr.in/Joliette'
alias cddev='cd ~/workbench/projects/$(ls ~/workbench/projects/ | fzf)/www'
alias showdev='ngrok start --config ~/workbench/projects/$(ls ~/workbench/projects/ | fzf)/ngrok.yml'
alias fzfp='fzf --preview '\''[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null | head -100'\'
alias nethack='ssh nethack@alt.org'
alias alacrittyfs="wmctrl -r 'alacritty' -b toggle,fullscreen"

# == Enable FZF shortcuts and completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --follow'

