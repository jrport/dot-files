local vim = vim
local k = vim.keymap.set
local dap_python = require('dap-python')
local dapui = require('dapui')
local dap = require('dap')
local neodev = require("neodev")

-- dap_python.setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
dap_python.setup("~/.pyenv/versions/3.10.13/bin/python")
dap_python.test_runner = 'pytest'


neodev.setup({
    library = { plugins = { "nvim-dap-ui" }, types = true },
})

dapui.setup()

dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end


k("n", "<leader>dm", function ()
    dap_python.test_method()
end)

k("n", "<leader>db", function ()
    dap.toggle_breakpoint()
end)

k("n", "<leader>dc", function ()
    dap.continue()
end)

k("n", "<leader>do", function ()
    dap.step_over()
end)

k("n", "<leader>di", function ()
    dap.step_into()
end)


k("n", "<leader>ee", function ()
    dapui.eval()
end)
