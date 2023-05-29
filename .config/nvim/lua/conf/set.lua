-- Base vim options

-- View line numbers (relative)
vim.o.number = true
vim.o.relativenumber = true

-- Set completeopt to have a better completion experience
--- :help completeopt
--- menuone: popup even when there's only one match
--- noinsert: Do not insert text until a selection is made
--- noselect: Do not auto-select, nvim-cmp plugin will handle this for us.
vim.o.completeopt = "menuone,noinsert,noselect"

-- Avoid showing extra messages when using completion
vim.opt.shortmess = vim.opt.shortmess + "c"

-- View tab characters
vim.o.invlist = true
vim.opt.listchars:append({
  tab = "▷▷",
})

-- Have a fixed column for the diagnostics to appear in
--- This removes the jitter when warnings/errors flow in from lsp
vim.wo.signcolumn = "yes"

-- Set updatetime for CursorHold
vim.opt.updatetime = 100

-- Timeout
vim.o.timeout = true
vim.o.timeoutlen = 300
