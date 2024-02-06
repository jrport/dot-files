local vim = vim
local k = vim.keymap.set


require("neotest").setup({
  adapters = {
    require("neotest-python")({
      dap = { justMyCode = false },
      runner = "pytest",
      python = "~/.pyenv/versions/3.10.13/bin/python",
    }),
    require("neotest-plenary"),
    require("neotest-vim-test")({
      ignore_file_types = { "python", "vim", "lua" },
    }),
  },
})

k( "n", "<leader>rt", function () require('neotest').run.run() end )
k( "n", "<leader>dt", function () require("neotest").run.run({strategy = "dap"}) end )
