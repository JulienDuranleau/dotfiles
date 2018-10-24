export ANDROID_HOME=/home/julien/Android/Sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

export JAVA_HOME=/usr/lib/jvm/java-8-oracle/
export PATH=$PATH:/usr/local/go/bin

export EDITOR=nvim
export SSH_KEY_PATH="~/.ssh/rsa_id"

export PATH=$PATH:~/scripts

# == ZSH specific
plugins=(git)

export ZSH="/home/julien/.oh-my-zsh"

DEFAULT_USER="julien"
ZSH_THEME="agnoster"

source $ZSH/oh-my-zsh.sh

prompt_dir() {                                                              
   prompt_segment blue white '%1d'
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
alias cddev='cd ~/workbench/projects/$(ls ~/workbench/projects/ | fzf)'

# == Enable FZF shortcuts and completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
