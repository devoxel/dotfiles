-- my new nvim
--
-- per plugin configs: lua/plugin/*.lua
--
-- i borrowed from a lot of other configs, see:
-- - https://github.com/LazyVim/LazyVim
-- - https://github.com/sharksforarms/neovim-rust
-- - https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/

-- Leader key -> " "
vim.g.mapleader = " "
vim.opt.filetype = "on"

-- Lazy plugin manager, see github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		-- steal lazyvim's plugins for now
		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },

		-- lazy lets you load plugins from a lua module, let's use that to load per plugin config.
		{ import = "plugins" },
	},
})
