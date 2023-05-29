local ok, treesitter = pcall(require, "nvim-treesitter.configs")

if not ok then
  return
end

treesitter.setup {
  -- A list of parser names, or "all"
  ensure_installed = { 
	  "bash", "fish",
	  "dockerfile", "toml", "json", "make", "vim", "vimdoc", 
	  "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore", 
	  "python", "lua", "javascript", "typescript", 
	  "c", "rust", "go",
  },

  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

