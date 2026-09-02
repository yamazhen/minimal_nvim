vim.g.mapleader = " "
vim.o.clipboard = "unnamedplus"
vim.o.colorcolumn = "80"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.signcolumn = "yes"
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true

vim.pack.add({
	{ src = "https://github.com/rose-pine/neovim",              name = "rose-pine" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/yamazhen/mason-conform" },
	{ src = "https://github.com/williamboman/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/nvim-mini/mini.nvim" },
	{ src = "https://github.com/Saghen/blink.cmp",              version = vim.version.range("1") },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/tpope/vim-fugitive" },
})

require("vim._core.ui2").enable()
require("conform").setup()
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-conform").setup()
require("mini.pick").setup()
require("mini.files").setup()
require("blink.cmp").setup()
require("rose-pine").setup({ styles = { transparency = true, italic = false } })

vim.cmd.colorscheme("rose-pine-moon")

vim.keymap.set("n", "<leader>g", "<cmd>Git<CR>")
vim.keymap.set("n", "<leader>ee", "<cmd>lua MiniFiles.open()<CR>")
vim.keymap.set("n", "<C-e>", "<cmd>Pick files<CR>")
vim.keymap.set("n", "<leader>ps", "<cmd>Pick grep_live<CR>")
vim.keymap.set("n", "<leader>sd", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>tt", vim.diagnostic.setloclist)
vim.keymap.set("n", "=", function()
	require("conform").format()
end)
