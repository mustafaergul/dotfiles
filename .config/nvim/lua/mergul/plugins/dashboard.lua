return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("dashboard").setup({
			theme = "hyper",
			config = {
				week_header = { enable = true },
				mru = {
					limit = 10, -- number of recent files to show
					icon = " ",
					label = "Recent files",
					cwd_only = true, -- ✅ only show files from current directory
				},
				shortcut = {
					-- Optional: add quick shortcuts if you like
					{
						icon = " ",
						desc = "New file",
						group = "@property",
						action = "enew",
						key = "n",
					},
					{
						icon = "󰱼 ",
						desc = "Find file",
						group = "@property",
						action = "Telescope find_files",
						key = "f",
					},
					{
						icon = "󰒲 ",
						desc = "Update plugins",
						group = "@property",
						action = "Lazy update",
						key = "u",
					},
				},
			},
		})
	end,
}
