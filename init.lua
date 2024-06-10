require("remaps")

-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

require("lazy").setup({
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		-- or                              , branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
  		"neanias/everforest-nvim",
  		version = false,
  		lazy = false,
  		priority = 1000, -- make sure to load this before all the other start plugins
  		-- Optional; default configuration will be used if setup isn't called.
  		config = function()
    		require("everforest").setup({
			background = "medium",
    			transparent_background_level = 1,
    			italics = true,
    			disable_italic_comments = false,
    		})
  		end,
	},
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
	{"mbbill/undotree"},
	{"tpope/vim-fugitive"},
})

vim.cmd([[colorscheme everforest]])

