-- easy.lua is all the plugins that require little to no config.
--
-- generally these ones are super lean.
return {
	-- i prefer to use netrw rather than mess with treesitter
	{ "tpope/vim-vinegar", keys = { { "-", "<cmd>:Explore<cr>", desc = "Explore" } } },

	-- a lots of plugins use plenary, lazy load it.
	{ "nvim-lua/plenary.nvim", lazy = true },
}
