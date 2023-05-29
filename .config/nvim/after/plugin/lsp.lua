local ok, zero = pcall(require, "lsp-zero")
if not ok then
  return
end

local lsp = zero.preset({})

local on_attach = function(_, buffer)
  local o = function(desc)
    return {
      buffer = buffer,
      desc = desc,
    }
  end

  -- set default lsp keymaps
  lsp.default_keymaps({ buffer = buffer })
  -- format on save
  lsp.buffer_autoformat()

  -- Code navigation and shortcuts
  vim.keymap.set("n", "<c-]>", vim.lsp.buf.definition, o("goto definition"))
  vim.keymap.set("n", "gD", vim.lsp.buf.implementation, o("goto definition"))
  vim.keymap.set("n", "K", vim.lsp.buf.hover, o("show hover"))
  vim.keymap.set("n", "1gD", vim.lsp.buf.type_definition, o(""))
  vim.keymap.set("n", "<leader>lh", vim.lsp.buf.signature_help, o("help"))
  vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, o("references"))
  vim.keymap.set("n", "<leader>l0", vim.lsp.buf.document_symbol, o("document symbol"))
  vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, o("goto defintion"))
  vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, o("actions"))

  -- Show diagnostic popup on cursor hover
  local diag_float_grp = vim.api.nvim_create_augroup("DiagnosticFloat", { clear = true })
  vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
      vim.diagnostic.open_float(nil, { focusable = false })
    end,
    group = diag_float_grp,
  })

  -- Goto previous/next diagnostic warning/error
  vim.keymap.set("n", "<leader>l[", vim.diagnostic.goto_prev, o("previous diagnostic"))
  vim.keymap.set("n", "<leader>l]", vim.diagnostic.goto_next, o("next diagnostic"))
end

-- setup keymaps
lsp.on_attach(on_attach)

-- get mason to download useful language servers
lsp.ensure_installed({
  'rust_analyzer',
  'gopls',
  'lua_ls',
})



-- per lsp configs
local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        -- HACK: should fix - get the language server to recognize the `vim` global
        globals = { "vim" },
      },
    },
  },
})


lsp.setup()
