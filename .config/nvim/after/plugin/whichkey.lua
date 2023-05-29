
local ok, which = pcall(require, "which-key")
if not ok then
  return
end

local wk = require("which-key")

-- I don't use which-key to set keybindings, I don't want to lock
-- myself into this interface forever. Instead just use it to document
-- stuff. bindings already have desc=<help> entries so we just need to document prefixs

wk.setup({
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "", -- symbol prepended to a group
  },
})

-- document leaders
wk.register({
  f = { name = "file" },
  l = { name = "lsp" },
}, { prefix = "<leader>" })
