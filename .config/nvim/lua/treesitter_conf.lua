require("nvim-treesitter.configs").setup {
    ensure_installed = { "c", "cpp", "rust", "lua", "python", "javascript", "json", "toml" },

    auto_install = true, 
    
    highlight = {
        enable = false,
        disable = { "rust", "javascript" },
    },
    
    rainbow = {
        enable = true,
    }
}
