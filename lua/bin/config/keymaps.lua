local M = {}

M.core = function()
  vim.keymap.set("n", "<c-w>", "<cmd>w<cr>", { silent = true, desc = "write buffer" })
end

-- NOTE:tools.lua
M.tree = {
  plugins = true,
  { "<leader>nt", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree" },
}

M.telescope = {
  plugins = true,
  { "m",          "<cmd>Telescope menu<cr>",                      mode = "n" },
  { "<leader>ff", "<cmd>Telescope find_files<cr>",                mode = "n" },
  { "<leader>fg", "<cmd>Telescope current_buffer_fuzzy_find<cr>", mode = "n" },
}

M.hop = {
  plugins = true,
  { "<a-m>", "<cmd>HopChar2<cr>", desc = "hop move two chars" },
}

M.comment = {
  plugins = true,
  { "gcc", mode = "n" },
  { "gbc", mode = "n" },
  { "gc",  mode = "v" },
}

M.which_key = {
  plugins = true,
  { "<ctrl>",  mode = "n" },
  { "<space>", mode = "n" },
}

M.neotree = {
  plugins = true,
  { "<leader>nt", "<cmd>Neotree<cr>", mode = "n" },
}

-- NOTE:ui.lua
M.bufferline = {
  plugins = true,
  { "<a-,>", "<cmd>bprevious<cr>", mode = "n" },
  { "<a-.>", "<cmd>bnext<cr>",     mode = "n" },
}

return M
