#!/bin/bash
while true; do
	echo "It is dangerous,can remove all plugins,undo history.Are you continue?"
	read -rp "[N/y]" conditions
	case "$conditions" in
	N | n)
		echo "failed."
    break
		;;
	Y | y)
    echo "Recover..."
		rm -rf ~/.local/share/nvím/
		rm -rf ~/.local/state/nvim/
		rm -rf ~/.cache/nvim/
    echo "success."
    echo "Please run "make sync" to use."
		break
		;;
	*)
		echo "Please input the right characters."
		;;
	esac
done
