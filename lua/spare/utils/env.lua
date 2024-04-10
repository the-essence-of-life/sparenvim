local Root = vim.fn.stdpath("config") .. "/lua/core"

-- HACK:Don't put global var set `vim`,or you'll can't open the neovim.
_G.spare = {}

---@type function<string>
function spare.stdpath(self)
  if self == "config" then
    return Root .. "/config.lua"
  elseif self == "lazy" then
    return Root .. "/lazy.lua"
  end
end

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

---@type function<string,table>
function spare.require_path(directory,modules)
  local path = directory .. "."
  if type(modules) == "table" then
    for _, module in ipairs(modules) do
      require(path .. module)
    end
  end
  if type(modules) == "string" then
    if type(modules) == "nil" then
      require(path)
    end
  end
end
