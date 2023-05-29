local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local ok, lazy = pcall(require, "lazy")
if not ok then
	print("could not load lazy")
end

-- vim.o.shell = "/usr/bin/bash" -- might be required if some shells start trying bash things

lazy.setup({
  -- color
  "ellisonleao/gruvbox.nvim",
  "nanotech/jellybeans.vim",

  -- git
  "tpope/vim-fugitive",

  -- netrw being better
  "tpope/vim-vinegar",

  -- detect indentation
  { "NMAC427/guess-indent.nvim", opts = {} },

  -- which key
  "folke/which-key.nvim",

  -- treesitter (AST based coloring)
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  -- telescope
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "jvgrootveld/telescope-zoxide",
    dependencies = { "nvim-telescope/telescope.nvim" },
  },

  -- LSP (lsp-zero.nvim handles most of the work here)
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Mason to manage language servers
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Improve mason + nvim-lspconfig compat

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    },
  },
})
