vim.cmd.packadd("packer.nvim")

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'prichrd/netrw.nvim'
    use { 
        'nvim-treesitter/nvim-treesitter',
        run = ":TSUpdate"
    }
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            {
                "nvim-telescope/telescope-live-grep-args.nvim",
                "nvim-lua/plenary.nvim" 
            },
        },
        config = function()
            require("telescope").load_extension("live_grep_args")
        end
    }
    use { 
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' 
    }
    use 'nvim-tree/nvim-web-devicons'
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }
    use 'nvim-treesitter/nvim-treesitter-context'
    use "folke/trouble.nvim"
    use "tpope/vim-fugitive"
    use 'numToStr/Comment.nvim'
    use 'f-person/git-blame.nvim'
    use 'tpope/vim-endwise'
    use 'tpope/vim-sleuth'
    use{
        'altermo/ultimate-autopair.nvim',
        event={'InsertEnter','CmdlineEnter'},
        branch='v0.6', --recomended as each new version will have breaking changes
        config=function ()
            require('ultimate-autopair').setup()
        end,
    }
    use{
        "windwp/nvim-ts-autotag",
        config = function()
            require('nvim-ts-autotag').setup()
        end,
    }
    use "chentoast/marks.nvim"
    use {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup()
        end,
    }
    use "j-hui/fidget.nvim"
    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-neotest/neotest-plenary",
            "nvim-neotest/neotest-vim-test",
            "nvim-neotest/neotest-python",
            "nvim-neotest/neotest-plenary"
        }
    }
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    use { "mfussenegger/nvim-dap-python" }
    use { "folke/neodev.nvim" }
    use {
        'linux-cultist/venv-selector.nvim',
        dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' }
    }
end)

