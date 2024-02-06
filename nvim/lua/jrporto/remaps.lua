local vim = vim
local k = vim.keymap.set

vim.g.mapleader = " "

-- netrw
k("n", "<leader>pv", ":Ex<CR>")

-- disable highlight
k("n", "<leader><Esc>", ":noh<CR>")

-- buffer jump
k("n", "<leader>q", ":bnext<CR>")

-- save
k("n", "<leader>w", ":w<CR>")

-- move lines up and down
k("v", "J", ":m '>+1<CR>gv=gv")
k("v", "K", ":m '<-2<CR>gv=gv")

-- source
k("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- jump to next/prev function
k("n", "nf", "]m")
k("n", "pf", "[m")
