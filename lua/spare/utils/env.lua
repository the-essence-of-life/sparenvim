local Root = vim.fn.stdpath("config") .. "/lua"

-- HACK:Don't put global var set `vim`,or you'll can't open the neovim.
_G.spare = {}

---@type table<string>
spare.stdpath = {
  d_plugins = Root .. "/spare/plugins",
  d_utils = Root .. "/spare/utils",
  d_config_index = Root .. "/spare/utils/index.lua",
  u_plugins = Root .. "/user/plugins",
  u_root = Root .. "/user",
  u_config = Root .. "/spare/user/config.lua",
}

---@type table<string>
spare.secret = {
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
}
