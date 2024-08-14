require("config.lazy")
require("config.set")
require("config.remap")
vim.cmd ":colorscheme catppuccin-macchiato"
require("mason").setup()
vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]
