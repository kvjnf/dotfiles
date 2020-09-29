# Created by newuser for 4.3.10
# cdコマンドの省略ができるようになる
setopt AUTO_CD
# cdで移動した履歴の保存ができる
setopt AUTO_PUSHD
# cd +と数字でタブでディレクトリ補完してくれるようになる
autoload -Uz compinit
compinit
#プロンプトに関する設定
#PROMPT="[%n@%m]%# "
#RPROMPT="[%~]"
#^Dでzshを終了しない
setopt IGNORE_EOF
#^Q/^Sのフローコントロールを無効にする
setopt NO_FLOW_CONTROL
#beep音を鳴らさない
setopt NO_BEEP
# *とか?とか[とか]を使うと、グロブ展開とかいうのが行われるらしい
# 対策
setopt nonomatch
#補完候補が２つ以上の場合、選択出来るようにする
zstyle ':completion:*:default' menu select=2
#MAMPのpath
PATH=$PATH:/Applications/MAMP/Library/bin
#homesteadのpathを追加
export PATH=${HOME}/.composer/vendor/bin:$PATH
#macvimの場合にalias vimにmacvimを設定
#case "$(uname)" in

#    Darwin) # OSがMacならば
#        if [[ -d /Applications/MacVim.app ]]; then # MacVimが存在するならば
#	    alias vim=/Applications/MacVim.app/Contents/MacOS/Vim
#	    alias vi=vim
#	fi
#	;;

#    *) ;; # OSがMac以外ならば何もしない
#esac
#if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

#nodebrew用の環境PATH
export PATH=$HOME/.nodebrew/current/bin:$PATH

#######################################
# Color
#######################################
# 色の設定
export LSCOLORS=gxfxcxdxbxegedabagacad
# 補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# ZLS_COLORSとは？
export ZLS_COLORS=$LS_COLORS
# lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export CLICOLOR=true
# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

#######################################
# php homebrewの設定
#######################################
case ${OSTYPE} in
    darwin*)
#export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"
#        export PATH="$(brew --prefix homebrew/php/php71)/bin:$PATH"
        ;;
esac
#######################################
# python pyenvの設定
#######################################
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if which pyenv > /dev/null; then
    eval "$(pyenv init -)"
fi
export PATH="$PYENV_ROOT/versions/anaconda3-4.1.0/bin:$PATH"
#######################################
# pip PATH設定
#######################################
export PATH="$HOME/.local/bin:$PATH"
#######################################
# yarn PATH設定
#######################################
export PATH="$(yarn global bin):$PATH"
#######################################
# rbenvの設定
#######################################
#[[ -d ~/.rbenv  ]] && \
#  export PATH=${HOME}/.rbenv/bin:${PATH} && \
#  eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
#######################################
# ANDROID_HOME設定
#######################################
export ANDROID_HOME=/usr/local/opt/android-sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
#######################################
# neofetch
#######################################
if type "neofetch" > /dev/null 2>&1; then
    neofetch
fi
#######################################
# zplug
#######################################
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh
zplug "b-ryan/powerline-shell"

# 未インストール項目をインストールする
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

#######################################
# powerline-shell
#######################################
function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi
#######################################
# Alias
#######################################
alias his='history'
alias p='pwd'
alias e='echo'
alias v='vim'
alias t='tree'
alias c='cat -n'
alias l='ls -a'
alias ll='ls -la'
alias vi='vim'
alias ll='ls -al'
alias log='tail -f 5'
alias g='git'
alias gs='git status'
alias gl='git log'
alias rm='rm -i'
alias cfx='~/Desktop/works/firefox/addon-sdk-1.17/bin/cfx'

alias subL="open -a /Applications/Sublime\ Text.app"
alias chrome="open -a /Applications/Google\ Chrome.app"
alias Stree="open -a /Applications/SourceTree.app"
alias Ffox="open -a /Applications/Firefox.app"
alias MAMP="open /Applications/MAMP"
alias Fdev="open -a /Applications/FirefoxDeveloperEdition.app"
alias homestead="~/.composer/vendor/bin/homestead"
alias Atom="open -a /Applications/Atom.app"
alias htdocs="/Applications/MAMP/htdocs"
alias beans="open -a /Applications/NetBeans/NetBeans\ 8.0.2.app"
alias nah="git reset --hard;git clean -df"
alias dockerlocal="docker run -d -p 3030:80 -v '$1:/usr/local/apache2/htdocs/' httpd"
case ${OSTYPE} in
    darwin*)
        export PATH=$(brew --prefix)/bin:$PATH
        defaults write com.apple.dock no-bouncing -bool true
        ;;
    linux*)
        alias pbcopy='xsel --clipboard --input'
        ;;
esac
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# wpcli
if [ -e /home/$USER/wp-completion.bash ]; then
    source /home/$USER/wp-completion.bash
fi


# added by travis gem
[ -f /home/kvjnf/.travis/travis.sh ] && source /home/kvjnf/.travis/travis.sh
