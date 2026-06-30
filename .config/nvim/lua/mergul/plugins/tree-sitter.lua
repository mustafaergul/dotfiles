return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	branch = "master", -- classic API (matches configs.setup below); main branch is the incompatible rewrite
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		-- import nvim-treesitter plugin
		local treesitter = require("nvim-treesitter.configs")

		vim.filetype.add({
			extension = {
				gts = "typescript.glimmer",
				gjs = "javascript.glimmer",
			},
		})
		-- configure treesitter
		treesitter.setup({
			-- enable syntax highlighting
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "ruby", "javascript", "typescript" },
			},
			-- enable indentation
			indent = { enable = true },
			-- enable autotagging (w/ nvim-ts-autotag plugin)
			autotag = {
				enable = true,
			},
			-- ensure these language parsers are installed
			ensure_installed = {
				"ruby",
				"glimmer",
				"typescript",
				"tsx",
				"javascript",
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"html",
				"json",
				"markdown",
				"markdown_inline",
				"gitignore",
				"dockerfile",
				"graphql",
				"css",
				"yaml",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
	end,
}
