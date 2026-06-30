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
	{ src = "https://github.com/vague-theme/vague.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/williamboman/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/nvim-mini/mini.nvim" }
})

require("vim._core.ui2").enable()
require("mason").setup()
require("mason-lspconfig").setup()
require("mini.completion").setup()
require("mini.pick").setup()
require("mini.files").setup()

vim.cmd.colorscheme("vague")

vim.keymap.set("n", "<leader>ee", "<cmd>lua MiniFiles.open()<CR>")
vim.keymap.set("n", "<C-e>", "<cmd>Pick files<CR>")
vim.keymap.set("n", "<leader>ps", "<cmd>Pick grep_live<CR>")
vim.keymap.set("n", "<leader>sd", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>tt", vim.diagnostic.setloclist)
vim.keymap.set("n", "=", function() vim.lsp.buf.format() end)
