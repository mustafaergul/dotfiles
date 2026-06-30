return {
	{ "nvim-lua/plenary.nvim" }, -- lua functions that many plugins use
	{
		"andymass/vim-matchup",
		config = function()
			-- Disable treesitter matching to avoid query errors
			vim.g.matchup_matchparen_enabled = 1
			vim.g.matchup_motion_enabled = 1
			vim.g.matchup_text_obj_enabled = 1
			vim.g.matchup_matchparen_fallback = 1
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
			-- Disable treesitter integration which causes errors
			vim.g.matchup_matchparen_deferred = 1
			vim.g.matchup_matchparen_hi_surround_always = 0
			vim.api.nvim_set_hl(0, "MatchParen", { fg = "#c4a7e7", bg = "#403d52", bold = true, underline = true })
			vim.api.nvim_set_hl(0, "MatchWord", { fg = "#c4a7e7", bg = "#403d52", bold = true, underline = true })
			vim.api.nvim_create_autocmd("ColorScheme", {
				callback = function()
					vim.api.nvim_set_hl(0, "MatchParen", { fg = "#c4a7e7", bg = "#403d52", bold = true, underline = true })
					vim.api.nvim_set_hl(0, "MatchWord", { fg = "#c4a7e7", bg = "#403d52", bold = true, underline = true })
				end,
			})
		end,
	},
	{ "tpope/vim-sensible" },
}
