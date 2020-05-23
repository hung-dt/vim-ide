# Neovim configuration files

## Key mappings

In the following table, `<ldr>` represents the `,` character.

| Shortcut        | Mode          | Description                                    |
|-----------------|---------------|------------------------------------------------|
| `F3`            | Normal        | Toggle showing list chars                      |
| `F4`            | Normal        | Toggle line numbers                            |
| `F5`            | Normal        | Toggle NerdTree and keep cursor in file window |
| `F6`            | Normal        | Toggle paste mode                              |
| `F8`            | Normal        | Toggle tagbar                                  |
| `F9`            | Normal        | Show terminal in split window                  |
| `<Ctrl>o`       | Normal        | Back to previous buffer                        |
| `<Ctrl>h/j/k/l` | Normal        | Navigate split windows                         |
| `<Shift>h/l`    | Normal        | Previous/next tab                              |
| `Space`         | Normal        | Open fold                                      |
| `<ldr>Space`    | Normal        | Clear highlights                               |
| `<ldr>w`        | Normal        | Save the current buffer                        |
| `<Alt>j/k`      | Normal/Visual | Move line/selection up or down (by vim-move)   |

## Installation

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

## Install [vim-plug](https://github.com/junegunn/vim-plug)

```
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
You should now have `plug.vim` in your autoload directory so it will load of on start.

### Config file for plugins

Put all configs for plugins in 1 files at: `~/.config/nvim/vim-plug/plugins.vim` with a minimal setup:
```
" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

  " Declare the list of plugins.
  Plug 'tpope/vim-sensible'
  Plug 'junegunn/seoul256.vim'
  " Better Syntax Support
  Plug 'sheerun/vim-polyglot'
  " File Explorer
  Plug 'scrooloose/NERDTree'
  " Auto pairs for '(' '[' '{' 
  Plug 'jiangmiao/auto-pairs'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
```

and source it in `init.vim`:
```
source $HOME/.config/nvim/vim-plug/plugins.vim
```

### Vim-plug commands

| Command        | Description                                                          |
|----------------|----------------------------------------------------------------------|
| `:PlugStatus`  | Check the status of your plugins                                     |
| `:PlugInstall` | Install all of your plugins                                          |
| `:PlugUpdate`  | To update your plugins                                               |
| `:PlugDiff`    | After the update you can press d to see the differences or run       |
| `:PlugClean`   | To remove plugins that are no longer defined in the plugins.vim file |
| `:PlugUpgrade` | Finally if you want to upgrade vim-plug itself run the following     |

## coc.nvim and ccls

### coc.nvim

### ccls build

Reference: https://github.com/MaskRay/ccls/wiki/Build

Prebuilt Clang+LLVM binaries [https://justiceboi.github.io/blog/install-clang-9-on-ubuntu/]

* Pick the one on https://releases.llvm.org/download.html that suits your system.
* Extract to `~/opt/clang_xxx`
* Add to `$PATH` and `$LD_LIBRARY_PATH`

Firstly the ccls needs to be cloned locally using git.
```
git clone --depth=1 --recursive https://github.com/MaskRay/ccls
cd ccls
```

There is a dependency to rapid/Json but that is solved through the recursive git clone call.

Build:

```
mkdir build && cd build
cmake .. -G Ninja -DCMAKE_BUILD_TYPE=Release \
-DCMAKE_INSTALL_PREFIX=$HOME/opt \
-DCMAKE_PREFIX_PATH=$HOME/clang_10.0.0-x86_64
```

In my build I get the following error:
```
fatal: No names found, cannot describe anything.
```
This seems to have something to do with git and its safe to ignore.

```
ninja -j 4

cmake --build . --target install
```

### Configure coc.nvim with ccls

Reference:
  https://www.cocode.se/c++/ccls.html
  https://github.com/MaskRay/ccls/wiki/coc.nvim
  https://ianding.io/2019/07/29/configure-coc-nvim-for-c-c++-development/

Open config file with command `:CocConfig`. This will open the file `~/.config/nvim/coc-settings.json`

Here you can add language servers and other configuration like autoformat and adding a location for snippets.

```
{
  "languageserver": {
    "ccls": {
      "command": "ccls",
      "filetypes": ["c", "cpp", "cuda", "objc", "objcpp"],
      "rootPatterns": [".ccls", "compile_commands.json", ".git/", ".hg/", ".svn/"],
      "initializationOptions": {
        "cache": {
          "directory": "/tmp/ccls-cache"
        },
        "client": {
          "snippetSupport": true
        }
      }
    }
  }
}
```

The `initializationOptions` is the json object that passed to language server on initialize.

The `rootPatterns` is used to resolve the root path which should contain one of the patterns as a child directory or file. For example, if a directory contains `.ccls-root` then the directory is the project root folder.

There are two ways to tell ccls your compile options.

1. Generate `compile_commands.json` and put it to your project root;
2. Place `.ccls` to your project root. It is a text file, in which each line is a command line argument passed to the compiler.

Here is an example of `.ccls` (each command line argument occupies a line):
```
clang
%cpp -std=c++17
%h -x
%h c++-header
-isystem/home/hungdt/opt/include
-isystem/home/hungdt/opt/include/SDL2
```
Ref: https://github.com/MaskRay/ccls/wiki/Project-Setup#ccls-file

## FZF, Ripgrep

Reference: https://medium.com/@sidneyliebrand/how-fzf-and-ripgrep-improved-my-workflow-61c7ca212861

FZF is a fuzzy file finder, written in Go, while Ripgrep is an extremely fast grep, written in Rust, that respects gitignore rules by default.

Install fzf and Ripgrep:
```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

add this line to `.zshrc`
```
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
```

Integrate with vim/nvim:
```
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
```
