require("persistence").setup {
  dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"), -- directory where session files are saved
  options = { "buffers", "curdir", "tabpages", "winsize" },     -- sessionoptions used for saving
  pre_save = nil,                                               -- a function to call before saving the session
}
