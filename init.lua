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
vim.keymap.set({'n'}, '<leader>t', ':TestSuite<CR>')

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


vim.call('plug#begin')
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate'})
Plug('https://github.com/junegunn/vim-easy-align.git')
Plug('neoclide/coc.nvim', { ['branch'] = 'release' })
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.8' })
Plug('nvim-tree/nvim-tree.lua')
Plug('nvim-tree/nvim-web-devicons')
Plug('tpope/vim-fireplace', { ['for'] = 'clojure' })
Plug('tpope/vim-fugitive')
Plug('tpope/vim-commentary')
Plug('catppuccin/nvim', { ['as'] = 'catppuccin' })
Plug('nvim-lualine/lualine.nvim')
Plug('christoomey/vim-tmux-navigator')
Plug('vim-test/vim-test')
Plug('preservim/vimux')
Plug('airblade/vim-gitgutter')
vim.call('plug#end')



vim.cmd.colorscheme("catppuccin")

require('lualine').setup {
    options = {
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
      theme = "catppuccin-frappe"
    }
}
require('plugins.coc')
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

require('nvim-treesitter.configs').setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
  },
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>n', '<cmd>NvimTreeToggle<cr>')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require('plugins.vim-test')
