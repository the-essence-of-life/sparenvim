local Root = vim.fn.stdpath("config") .. "/lua"

-- HACK:Don't put global var set `vim`,or you'll can't open the neovim.
_G.spare = {
  builtin = {
    plugins = Root .. "/spare/plugins",
    utils = Root .. "/spare/utils",
    config_index = Root .. "/spare/utils/index.lua",
  },
  user = {
    plugins = Root .. "/user/plugins",
    root = Root .. "/user",
    config_index = Root .. "/spare/user/index.lua",
  },
  secret = {
    [[
    Hello,this is spare.
    Welcome back!
    I'm a human.
    Just kidding :)
    ]],
    [[
    Tell me a little bit more about you.
    I'm a human.
    ]],
    [[
    HaHa!This is the least sentence!
    Have a nice day :)
    ]],
  },
  funs = require("spare.utils.funs"),
  process = require("spare.utils.process")
}
