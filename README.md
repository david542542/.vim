**To install on Ubuntu (everything):**

```
curl -O https://raw.githubusercontent.com/david542542/.vim/master/install.sh && sudo chmod a+x install.sh && ./install.sh && . ~/.bash_profile
```

---

**On CentOS (vim-only):**

```
# https://phoenixnap.com/kb/how-to-install-vim-centos-7
$ sudo yum install gcc make ncurses ncurses-devel
$ sudo git clone https://github.com/vim/vim.git
$ cd vim
$ sudo ./configure --with-features=huge --enable-multibyte --enable-pythoninterp
$ sudo make
$ sudo make install
```

---

**As a last resort (vim-only): 

`sudo apt-get install vim-gtk`
