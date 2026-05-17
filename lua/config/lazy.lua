-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

------------------------------------------------------------------------------------------------

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Set default tab length and behavior
vim.opt.tabstop = 4 -- Number of spaces a <Tab> counts for
vim.opt.shiftwidth = 4 -- Number of spaces used for auto-indentation
vim.opt.expandtab = false -- Use spaces instead of tabs
vim.opt.autoindent = false
vim.opt.smartindent = false

-- Dont Wrap Text
vim.opt.wrap = false

-- Fix Pasting
vim.g.pastetoggle = true

-- Set Line Number
vim.opt.number = true
vim.opt.relativenumber = true

-- Highlight Cursor Line
vim.opt.cursorline = true

-- Disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set Undo File
vim.opt.undofile = true

-- Optionally enable 24-bit colour
vim.opt.termguicolors = true

-- Add Spacing to Number Column
vim.opt.signcolumn = "yes"

-- Allow Scrolloff of Buffer
vim.opt.scrolloff = 4

------------------------------------------------------------------------------------------------

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "tokyonight" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})
