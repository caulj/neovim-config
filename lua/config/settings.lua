-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Set default tab length and behavior
vim.opt.tabstop = 4       -- Number of spaces a <Tab> counts for
vim.opt.shiftwidth = 4    -- Number of spaces used for auto-indentation
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

-- Set Terminal
vim.keymap.set('n', '<leader>t', ':terminal<CR>')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
