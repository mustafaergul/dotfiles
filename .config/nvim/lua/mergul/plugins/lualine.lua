return {
	"nvim-lualine/lualine.nvim",
	-- dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		-- configure lualine with modified theme
		lualine.setup({
			options = {
				icons_enabled = true,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = { "NvimTree", "neo-tree", "avante" },
				},
				always_divide_middle = true,
				theme = "catppuccin",
				globalstatus = false,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", { "diagnostics", sources = { "nvim_lsp", "coc" } } },
				lualine_c = {
					{
						icons_enabled = true,
						"filename",
						file_status = true, -- displays file status (readonly status, modified status)
						path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
						--shorting_target = 40 -- Shortens path to leave 40 space in the window
					},
				},
				lualine_x = { "filetype" },
				lualine_y = {},
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = { "progress" },
				lualine_z = {},
			},
			tabline = {},
			extensions = { "neo-tree", "avante" },
		})
	end,
}
