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


