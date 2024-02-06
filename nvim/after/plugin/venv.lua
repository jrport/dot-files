local k = vim.keymap.set
local vensel = require"venv-selector"

k("n", "<leader>cv", ":VenvSelect<CR>")

vensel.setup()
