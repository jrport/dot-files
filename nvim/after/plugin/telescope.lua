local keybind = vim.keymap.set
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

keybind('n', '<leader>fs', require("telescope").extensions.live_grep_args.live_grep_args, { noremap = true })

keybind('n', '<leader>ff', builtin.find_files, {})
keybind('n', '<C-p>', builtin.git_files, {})
keybind("n", "<leader>lg", builtin.live_grep, {})
keybind('n', '<leader>fb', builtin.buffers, {})

require('telescope').setup{
    pickers = {
        find_files = {
            hidden = true,
            theme = "dropdown",
        },
        buffers = {
            show_all_buffers = true,
            sort_lastused = true,
            theme = "dropdown",
            previewer = true,
            mappings = {
                i = {
                    ["<C-d>"] = "delete_buffer",
                }
            }
        }
    },
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        }
    }
}
