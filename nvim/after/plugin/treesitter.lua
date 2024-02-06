require'nvim-treesitter.configs'.setup{
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "python" },
    auto_install = true,
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },  
}
