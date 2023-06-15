run:
	bash ./scripts/run.sh
	nvim --headless +Lazy sync +q
update:
	git fetch
debug:
	bash ./scripts/debug.sh
rec:
	bash ./scripts/rec.sh
look-config:
	nvim ~/.config/nvim/lua/bin/config/
add-plugin:
	nvim ~/.config/nvim/lua/bin/plugins/
# clean:
