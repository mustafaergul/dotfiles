return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		-- import nvim-treesitter plugin
		local treesitter = require("nvim-treesitter.configs")

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
				"html",
				"gitignore",
				"dockerfile",
				"graphql",
				"css",
				"html",
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
			-- Enable highlight when opening the file with file type
			-- on_ft = function(ft)
			-- 	vim.cmd("TSBufEnable")
			-- end,
			-- matchup = {
			-- 	enable = true, -- mandatory, false will disable the whole extension
			-- 	-- disable = { "c", "ruby" }, -- optional, list of language that will be disabled
			-- 	-- [options]
			-- },
		})
	end,
}
