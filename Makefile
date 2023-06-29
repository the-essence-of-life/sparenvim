sync:
	bash ./scripts/run.sh
	nvim --headless +Lazy sync +q
init:
	bash ./scripts/run.sh
	bash ./scripts/switch.sh
	nvim --headless +Lazy sync +q
update-repo:
	git fetch
debug:
	bash ./scripts/debug.sh
rec:
	echo "You can use \"bash ./scripts/rec.sh\" to start a recovery."
set-options:
	nvim ~/.config/nvim/lua/bin/config/
add-plugins:
	nvim ~/.config/nvim/lua/bin/plugins/
switch-config:
	bash ./scripts/switch.sh
# clean:
