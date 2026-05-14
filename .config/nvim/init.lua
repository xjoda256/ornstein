-- ~/.config/nvim/init.lua
-- ×Joda™

-- vim options --
vim.o.number = true
vim.o.showmatch = true
vim.o.cursorline = true
vim.o.swapfile = false
vim.o.undofile = true
vim.o.termguicolors = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = false
vim.o.softtabstop = 2
vim.o.signcolumn = "yes"
vim.o.smartindent = true
vim.o.winborder = "rounded"
vim.diagnostic.config({ underline = false })

-- keybinds --
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>o", ":update<CR> :source<CR>")
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>f", ":Pick files<CR>")
vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>e", ":Oil<CR>")
vim.keymap.set("n", "<leader>c", ":ColorizerToggle<CR>")
vim.keymap.set("n", "<leader>d", ":lua vim.diagnostic.open_float()<CR>")
vim.keymap.set("n", "<leader>z",		"zR")

-- plugins --
vim.pack.add({
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-mini/mini.pick" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/saghen/blink.lib" },
	{ src = "https://github.com/saghen/blink.cmp" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ src = "https://github.com/folke/snacks.nvim" },
	{ src = "https://github.com/norcalli/nvim-colorizer.lua" },
	-- colorschemes --
	{ src = "https://github.com/rose-pine/neovim" },
	{ src = "https://github.com/neanias/everforest-nvim" },
	{ src = "https://github.com/vague-theme/vague.nvim" },
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/folke/tokyonight.nvim" },
	{ src = "https://github.com/Mofiqul/dracula.nvim" },
	{ src = "https://github.com/rebelot/kanagawa.nvim" },
	{ src = "https://github.com/sainnhe/sonokai" },
	{ src = "https://github.com/Shatur/neovim-ayu" },
	{ src = "https://github.com/armannikoyan/rusty" },
	{ src = "https://github.com/tanvirtin/monokai.nvim" },
	{ src = "https://github.com/uZer/pywal16.nvim" },
})

-- plugin setup --
require("mini.pick").setup()
require("oil").setup()
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
	ensure_installed = {
		"lua_ls",
		"stylua",
		"bashls",
		"shellcheck",
		"marksman",
		"vim-language-server",
	},
})

require("snacks").setup({
	indent = { enabled = true },
	dashboard = { enabled = false },
	statuscolumn = { enabled = false },
	dim = { enabled = true },
	animate = { enabled = true },
	zen = { enabled = true },
})

vim.lsp.config("lua_ls", {
	root_markers = { ".luarc.json", ".luarc.jsonc", "selene.toml", "stylua.toml" },
	settings = {
		Lua = {
			workspace = {
				checkThirdParty = false,
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})

-- folding options --
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- vim.opt.foldcolumn = "0"
-- vim.opt.foldtext = ""
-- vim.opt.foldlevel = 99
-- vim.opt.foldlevelstart = 1
-- vim.opt.foldnestmax = 4

-- set colorscheme --
vim.cmd([[colorscheme tokyonight]])
vim.cmd([[highlight StatusLine none]])

