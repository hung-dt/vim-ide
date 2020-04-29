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

## Install neovim using AppImage
* Remove the current version of NeoVim
`sudo apt-remove neovim`
* Download latest neovim.appimage [here](https://github.com/neovim/neovim/releases) to `~/Downloads`
* Move it to `~/opt/bin`, make it executable and create symlink `nvim` to it.
```
cd ~/Downloads
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
mv nvim.appimage ~/opt/bin
cd ~/opt/bin
chmod u+x nvim.appimage
ln -s nvim.appimage nvim
```
* Add `~/opt/bin` to `$PATH` and create alias:
```
export PATH=$HOME/opt/bin:$PATH
alias vi=nvim
alias vim=nvim
export EDITOR=$HOME/opt/bin/nvim
```

## Install neovim using PPA:

Run the following commands:
```
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
```

## Python integration

Prerequisites for the Python modules:
```
sudo apt-get install python-dev python-pip python-setuptools python3-dev python3-pip python3-setuptools
```

To use python plugins, you need the `pynvim` module.

> You should install both pynvim modules if you have both Python2 and 3 in your system.

For Python 3 plugins:
1. Make sure Python 3.4+ is available in your $PATH.
2. Install the module (try "python" if "python3" is missing):
```
python3 -m pip install --user --upgrade pynvim
```

For Python 2 plugins:
1. Make sure Python 2.7 is available in your $PATH.
2. Install the module (try "python" if "python2" is missing):
```
python2 -m pip install --user --upgrade pynvim
```

The pip `--upgrade` flag ensures that you get the latest version even if a previous version was already installed.

> If you got error message `Failed building wheel for pynvim` you can ignore it or fix it by install wheel module:
> `pip install wheel`

After that run `nvim` and `:checkhealth` and you should see the report:
```
## Python 2 provider (optional)    
  - INFO: `g:python_host_prog` is not set.  Searching for python2 in the environment.    
  - INFO: Executable: /usr/bin/python2    
  - INFO: Python version: 2.7.17    
  - INFO: pynvim version: 0.4.1    
  - OK: Latest pynvim is installed.
    
## Python 3 provider (optional)    
  - INFO: `g:python3_host_prog` is not set.  Searching for python3 in the environment.    
  - INFO: Executable: /usr/bin/python3                                                                                              
  - INFO: Python version: 3.6.9    
  - INFO: pynvim version: 0.4.1    
  - OK: Latest pynvim is installed.    
```
