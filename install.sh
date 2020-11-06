#!/bin/bash
# # Check if we have vim version 8.1+ installed
# VIM_PATH=$(which vim)
# VIM_VERSION=$(vim --version |grep '8.[123]')
# echo Vim path is: $VIM_PATH
# echo Vim version is: $VIM_VERSION

# Get OS

if [ -a /etc/os-release ]; then source /etc/os-release; else NAME='Mac'; fi
echo $NAME
if [ $NAME = 'Ubuntu' ]; then
    echo 1/3. updating vim...
    sudo add-apt-repository ppa:jonathonf/vim
    sudo apt update
    sudo apt install vim
    sudo apt-get install ctags # needs java if we want to do this
    echo 2/3. downloading vim from git...
    cd ~
    if [ -d ~/.vim ]; then 
        rm -rf ~/.vim
    fi
    git clone https://github.com/david542542/.vim.git
    echo 3/3. installing plugins...
    vim +PlugInstall +qall
else
    echo 'Not ubuntu -- install manually'
fi

# Install it2copy
URL="https://raw.githubusercontent.com/gnachman/iterm2-website/master/source/utilities/it2copy"
cd /usr/bin && { sudo curl -O $URL ; cd -; }
sudo chmod a+x /usr/bin/it2copy


if [ -z "$(grep 'VIM,TMUX' ~/.bash_profile)" ]
then
    sudo chmod a+w ~/.bash_profile
    echo '# VIM,TMUX stuff'                 >> ~/.bash_profile
    echo 'VIM="$(which vim)"'               >> ~/.bash_profile
    echo 'export EDITOR="$VIM"'             >> ~/.bash_profile
    echo 'export VISUAL="$VIM"'             >> ~/.bash_profile
    echo 'alias vi="$VIM"'                  >> ~/.bash_profile
    echo 'alias V="cd ~/.vim"'              >> ~/.bash_profile
    echo 'alias S="source ~/.bash_profile"' >> ~/.bash_profile
    echo 'alias ta="tmux -CC a -dt"'        >> ~/.bash_profile
    echo 'alias tn="tmux -CC new -s"'       >> ~/.bash_profile
    echo 'alias tl="tmux ls"'               >> ~/.bash_profile
    echo 'alias tk="tmux kill-session -t"'  >> ~/.bash_profile
    echo ''                                 >> ~/.bash_profile
    echo added new Bash_profile lines
else
    echo Bash_profile lines already added
fi
