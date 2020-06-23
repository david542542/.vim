# RUN THESE COMMANDS
```

# To update vim
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim

# To install the vim stuff
apt-get install ctags # needs java if we want to do this
cd ~ && git clone git@github.com:david542542/.vim.git
cp -r .vim/others/. .
vim +PlugInstall +qall
```

