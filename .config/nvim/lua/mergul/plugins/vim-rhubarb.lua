return {
	{
		"tpope/vim-fugitive",
		dependencies = {
			"tpope/vim-rhubarb", -- adds GitHub support to :GBrowse
		},
		cmd = { "Git", "GBrowse" }, -- lazy-load on these commands
		keys = {
			{ "<leader>gb", "<cmd>GBrowse<cr>", desc = "Open in GitHub" },
			{ "<leader>gB", "<cmd>GBrowse!<cr>", desc = "Copy GitHub URL" },
		},
	},
}
