#!/bin/bash
# shellcheck disable=1090
echo "Debug log:"
nvim --headless +q
if [[ "echo $SHELL" =~ "bash" ]]; then
	echo "alias debug-nvim='nvim --headless +q'" >>~/.bashrc
elif [[ "echo $SHELL" =~ "zsh" ]]; then
	echo "alias debug-nvim='nvim --headless +q'" >>~/.zshrc
elif [[ "echo $SHELL" =~ "fish" ]]; then
	echo "abbr -a debug-nvim nvim --headless +q" >>~/.config/fish/config.fish
fi
echo "You can use debug-nvim to debug your neovim."
echo "Please reboot your terminal to use the command."
echo "WARN:neovim 10.0 cannot open files."
echo "So use nvim --clean to open the files."
