export EDITOR=nvim
export SSH_KEY_PATH="~/.ssh/rsa_id"

export ANDROID_HOME=/home/julien/Android/Sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export PATH=${PATH}:$HOME/bin

export JAVA_HOME=/usr/lib/jvm/java-8-oracle/
export PATH=$PATH:/usr/local/go/bin

export PATH=$PATH:~/.config/composer/vendor/bin
export PATH=$PATH:~/dotfiles/scripts

export ZSH_DISABLE_COMPFIX=true

# == ZSH specific
plugins=(git)

export ZSH=~/".oh-my-zsh"

DEFAULT_USER="$(whoami)"
ZSH_THEME="agnoster"

source $ZSH/oh-my-zsh.sh

prompt_dir() {                                                              
   prompt_segment blue black '%1d'
}  

# == Dotfiles affected by mv, cp, rm...
setopt GLOB_DOTS

# == Fancier ls
alias ls='ls --color -h -1 --group-directories-first'

# == Set tab as escape
/usr/bin/setxkbmap -option "caps:escape"

# == Set typing speed
xset r rate 250 20

# == Rust
source $HOME/.cargo/env

# == Disable ctrl-s to enable it in nvim
stty start undef
stty stop undef
setopt noflowcontrol

# == Enable FZF shortcuts and completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --follow --hidden -u --glob "!.git" --glob "!vendor/" --glob "!node_modules/"'

# == Aliases
# alias dev=@See scripts/dev
alias tmux='TERM=xterm-256color tmux'
alias redev='tmux at -t'
alias killdev='tmux kill-session -t'
alias weather='curl wttr.in/Joliette'
alias cddev='cd ~/workbench/projects/$(\ls ~/workbench/projects/ | fzf)/www'
alias showdev='ngrok start --config ~/workbench/projects/$(\ls ~/workbench/projects/ | fzf)/ngrok.yml'
alias fzfp='fzf --preview '\''[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null | head -100'\'
alias nethack='ssh nethack@alt.org'
alias glog='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias octoup='php artisan october:up --no-ansi'

# usage: how_in php list array keys
how_in() { where="$1"; shift;IFS=+ curl "https://cht.sh/$where/$*?Q" }

