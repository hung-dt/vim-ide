# Neovim configuration files

Install on Ubuntu/Mint
```
sudo apt-get install neovim
```
Support for python:
```
sudo apt-get install python-neovim python3-neovim
```
Make neovim use vim's config/plugins
```
ln -s ~/.vim ~/nvim
ln -s ~/.vimrc ~/nvim/init.vim
```
Install Exuberant ctags
```
sudo apt-get install ctags
```
or compile universal ctags (preferred)
```
# First install autoconf and automake
sudo apt-get install autoconf automake

# then clone and compile universal ctags
git clone https://github.com/universal-ctags/ctags.git
cd ctags
./autogen.sh 
./configure
make
sudo make install
```
