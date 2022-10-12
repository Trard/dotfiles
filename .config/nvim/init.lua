local fn = vim.fn

-- Helpers
require('helpers')

-- General settings
require('general')

-- Packages
local packer = require 'packer'
packer.init {
	compile_path = fn.stdpath('data') .. '/packer_compiled.lua'
}

local use = packer.use

-- Packer itself
use 'wbthomason/packer.nvim'

-- Syntax highligth
use 'treesitter_conf'

use 'rust-lang/rust.vim'
use 'pangloss/vim-javascript'

-- Autocomplete
use {
    'hrsh7th/nvim-cmp',
    config = function() require('cmp_conf') end,
    requires = {
        'hrsh7th/vim-vsnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-calc',
        'hrsh7th/cmp-nvim-lua',
        'kdheepak/cmp-latex-symbols',
    }
}

-- LSP
use { 'neovim/nvim-lspconfig', config = function() require('lsp_conf') end }

-- Pretty LSP diagnostics
use {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
        require("lsp_lines").setup()
    end,
}

-- Deep Ocean Theme
use 'marko-cerovac/material.nvim'
vim.g.material_style = "deep ocean"
vim.cmd 'colorscheme material'

-- Run all config
dofile(fn.stdpath("data") .. "/packer_compiled.lua")
