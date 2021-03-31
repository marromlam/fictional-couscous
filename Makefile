# This file install all shit



FC=${HOME}/fictional-couscous
TMUX_SHARE=${HOME}/.config/tmux

all: brew neovim vim tmux fzf-marks

install:
	stow --ignore ".DS_Store" --target="$(HOME)" --dir="$(FC)" files

brew:
	brew bundle --file="$(FC)/homebrew/Brewfile"

neovim:
	python3 -m pip install --upgrade pynvim
	nvim +PlugInstall +qall

vim:
	ln -s ${FC}/files/.config/nvim ~/.vim
	ln -s ${FC}/files/.config/nvim/init.vim ~/.vimrc

fzf-marks:
	if [ ! -d ~/fzf-marks ]; then
	  git clone https://github.com/urbainvaes/fzf-marks.git ~/fzf-marks;
	fi

.PHONY: all install brew neovim vim tmux
