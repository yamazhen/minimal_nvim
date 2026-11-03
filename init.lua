vim.g.mapleader = " "
vim.o.clipboard = "unnamedplus"
vim.o.colorcolumn = "80"
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.wrap = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.swapfile = false
vim.o.undofile = true
vim.o.signcolumn = "yes"
vim.o.nu = true
vim.o.relativenumber = true

vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/yamazhen/mason-conform",
	"https://github.com/williamboman/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/tpope/vim-fugitive",
})

require("vim._core.ui2").enable()
require("mason").setup()
require("mason-conform").setup()
require("mini.pick").setup()
require("mini.files").setup({ windows = { max_number = 1 } })
require("mini.completion").setup()
require("mini.hues").setup({ background = "#d6c7a1", foreground = "#4a2a1e", saturation = "low" })
require("mason-lspconfig").setup({ automatic_enable = { exclude = { "jdtls" } } })

vim.keymap.set("n", "<leader>g", "<cmd>Git<CR>")
vim.keymap.set("n", "<C-e>", "<cmd>Pick files<CR>")
vim.keymap.set("n", "<leader>ps", "<cmd>Pick grep_live<CR>")
vim.keymap.set("n", "<leader>tt", vim.diagnostic.setloclist)
vim.keymap.set("n", "<leader>ee", function() require("mini.files").open(vim.api.nvim_buf_get_name(0)) end)
vim.keymap.set("n", "=", function() require("conform").format() end)
