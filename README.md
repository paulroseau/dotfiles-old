# My Dotfiles

These are some of my dotfiles to work on MacOS X :
- git
- Karabiner to remap some keys of the keyboard
- Neovim

## Main install

1. Install homebrew : https://brew.sh/

2. Install git :
```
brew install git
```

3. Clone this repo at the right place
```
cd
mkdir .config
git clone git@github.com:paulroseau/dotfiles.git ~/.config
```

## Git

Some aliases and default gitignore should be working out of the box

## Karabiner (Mac OS X only)

Install Karabiner : https://pqrs.org/osx/karabiner/

The current config does the following on a typical Mac OS keyboard :
- exchange Ctrl-L and Fn
- Set Alt-R to Ctrl-R
- exchange Alt-L and Command-L in Terminal Apps
- exchange Alt-R and Command-R in Terminal Apps

## Neovim

1. Install neovim :
```
brew install neovim
```

2. Install python3 and neovim python client library:
```
brew install python
pip3 install pynvim
```

3. Set up the plugins after launching neovim :
```
:PlugUpgrade
:PlugInstall
:UpdateRemotePlugins
```

### In iTerm2 (Mac OS X only)

#### Solarized

Go to Profile / Colors 
Select Solarized (dark) for Color Presets

#### vim-airline

Install powerline fonts :
```
cd
mkdir temp
cd temp
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ../../
rm -rf temp
```

In iTerm2 choose font `Source code Pro for powerline` and set font size to `14`

#### Misc issues

`C-h` is caught by iTerm2 and translated to `backspace` (check this in insert mode pressing `C-h` after typing some keys). 

Run the following in your $HOME directory :
```
infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
tic $TERM.ti
rm $TERM.ti
```
cf. https://github.com/neovim/neovim/issues/2048 (Tarruda's answer)
