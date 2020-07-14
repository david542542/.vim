1. Make sure vim is installed and version 8.2+
---
```
# To update vim
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim

# To install the vim stuff
apt-get install ctags # needs java if we want to do this
cd ~ && git clone git@github.com:david542542/.vim.git
vim +PlugInstall +qall
```

Travis: `sudo apt-get install vim-gtk`

On CentOS:

```
# https://phoenixnap.com/kb/how-to-install-vim-centos-7
$ sudo yum install gcc make ncurses ncurses-devel
$ sudo git clone https://github.com/vim/vim.git
$ cd vim
$ sudo ./configure --with-features=huge --enable-multibyte --enable-pythoninterp
$ sudo make
$ sudo make install
```



2. Copy over the various shortcuts that are helpful in the `.bash_profile`:

if [ -z "$(grep 'VIM,TMUX' ~/.bash_profile)" ]
then
    echo '# VIM,TMUX stuff'                 >> ~/.bash_profile
    echo 'VIM="$(which vim)"'               >> ~/.bash_profile
    echo 'export EDITOR="$VIM"'             >> ~/.bash_profile
    echo 'export VISUAL="$VIM"'             >> ~/.bash_profile
    echo 'alias vi="$VIM"'                  >> ~/.bash_profile
    echo 'alias V="cd ~/.vim"'              >> ~/.bash_profile
    echo 'alias S="source ~/.bash_profile"' >> ~/.bash_profile
    echo 'alias ta="tmux -CC a -t"'         >> ~/.bash_profile
    echo 'alias tn="tmux -CC new -s"'       >> ~/.bash_profile
    echo 'alias tl="tmux ls"'               >> ~/.bash_profile
    echo 'alias td="tmux ls"'               >> ~/.bash_profile
    echo 'alias tk="tmux kill-session -t"'  >> ~/.bash_profile
    echo 'alias t="tmux -CC a"'             >> ~/.bash_profile
    echo ''                                 >> ~/.bash_profile
    echo added new lines
else
    echo lines already added
fi

