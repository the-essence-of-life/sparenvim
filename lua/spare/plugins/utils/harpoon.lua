local status_ok, harpoon = pcall(require, "harpoon")
if not status_ok then
	return
end

harpoon.setup({})

vim.keymap.set("n", "<leader>nf", '<cmd>lua require("harpoon.mark").add_file()<cr>')
vim.keymap.set("n", "<leader>la", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>')
vim.keymap.set("n", "<leader>1", '<cmd>lua require("harpoon.ui").nav_file(1)<cr>')
vim.keymap.set("n", "<leader>2", '<cmd>lua require("harpoon.ui").nav_file(2)<cr>')
vim.keymap.set("n", "<leader>3", '<cmd>lua require("harpoon.ui").nav_file(3)<cr>')
vim.keymap.set("n", "<leader>4", '<cmd>lua require("harpoon.ui").nav_file(4)<cr>')
vim.keymap.set("n", "<leader>5", '<cmd>lua require("harpoon.ui").nav_file(5)<cr>')

vim.cmd("highlight! HarpoonInactive guibg=NONE guifg=#63698c")
vim.cmd("highlight! HarpoonActive guibg=NONE guifg=white")
vim.cmd("highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7")
vim.cmd("highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7")
vim.cmd("highlight! TabLineFill guibg=NONE guifg=white")
