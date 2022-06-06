local api = vim.api

local nvim_metals_group = api.nvim_create_augroup("nvim-metals", { clear = true })

vim.opt_global.shortmess:remove("F"):append("c")

metals_config = require("metals").bare_config()
metals_config.init_options.statusBarProvider = "on"

api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt", "java" },
  callback = function()
    require("metals").initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group,
})
