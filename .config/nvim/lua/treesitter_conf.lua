require("nvim-treesitter.configs").setup {
    ensure_installed = { "c", "cpp", "rust", "lua", "python", "javascript", "json", "toml" },

    auto_install = true, 
    
    disable = { "rust" },

    highlight = {
        enable = true,
    },
    
    rainbow = {
        enable = true,
    }
}
