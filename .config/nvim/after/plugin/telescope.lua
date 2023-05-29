local ok, telescope = pcall(require, "telescope")

if not ok then
  return
end

telescope.setup({
  defaults = {
    -- Using vertical strategy because not having cut-off list entries is more
    -- important for narrower window size.
    layout_strategy = "vertical",
    -- Default cycle scroll strategy is confusing, don't wraparound at the end.
    -- One can also use gg and G to jump to the other end.
    scroll_strategy = "limit",
  },
  pickers = {
    colorscheme = {
      enable_preview = true,
      layout_config = {
        prompt_position = "top",
        mirror = true,
        preview_height = 1,
        height = 15,
        anchor = "S",
      },
    },
    lsp_document_symbols = {
      -- For document symbols (which is used also for markdown heading jumping)
      -- have the ascending sorting so that entries matcher order in the file
      sorting_strategy = "ascending",
      layout_strategy = "vertical",
      layout_config = {
        prompt_position = "top",
        mirror = true,
        preview_height = 0.3,
      },
    },
  },
})

telescope.load_extension("zoxide")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "find files" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "live grep" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "find buffers" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "help tags" })
vim.keymap.set("n", "<leader>fz", telescope.extensions.zoxide.list, { desc = "change directory (zoxide)" })
