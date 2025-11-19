return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl",
	opts = {
		indent = { char = "┊", smart_indent_cap = false },
		whitespace = { highlight = highlight, remove_blankline_trail = false },
	},
}
