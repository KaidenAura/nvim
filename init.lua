vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = ' '
vim.opt.termguicolors = true


local set = vim.opt
local vim = vim
local Plug = vim.fn['plug#']
-- keymaps

vim.keymap.set({'i'}, 'jk', '<ESC>')
vim.keymap.set({'n'}, '<c-k>', ':wincmd k<CR>')
vim.keymap.set({'n'}, '<c-j>', ':wincmd j<CR>')
vim.keymap.set({'n'}, '<c-h>', ':wincmd h<CR>')
vim.keymap.set({'n'}, '<c-l>', ':wincmd l<CR>')

vim.wo.relativenumber = true
set.termguicolors = true
set.expandtab = true
set.tabstop = 2
set.shiftwidth = 2
set.smartindent = true
set.signcolumn = 'yes'
set.smartcase = true
set.undofile = true
set.showmode = false
set.splitright = true
set.splitbelow = true
set.hlsearch = true
set.clipboard = 'unnamedplus'

require("keymap")
require("plugins.init")
vim.cmd.colorscheme("catppuccin")

