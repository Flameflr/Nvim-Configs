require("core.lazy")
require("config.remap")
require("lsp")


require("lazy").setup("plugins")


vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
vim.api.nvim_set_hl(0, 'Normal', {bg = 'NONE'})
