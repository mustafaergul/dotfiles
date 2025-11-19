return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		filtered_itesm = {
			hide_dotfiles = false,
			hide_gitignored = false,
		},
		filesystem = {
			hijack_netrw_behavior = "disabled",
		},
	},
	config = function()
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal toggle right<CR>", {})
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal toggle float<CR>", {})
	end,
}
