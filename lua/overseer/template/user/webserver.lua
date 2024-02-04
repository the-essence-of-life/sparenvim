return {
  name = "webserver",
  builder = function()
    return {
      cmd = { "pnpm", "dev" },
    }
  end,
  condition = {
    filetype = "html"
  },
}
