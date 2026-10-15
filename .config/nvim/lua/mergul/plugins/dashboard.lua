return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	init = function()
		-- dashboard-nvim rewrites its project cache asynchronously from every open
		-- nvim instance with no locking, so concurrent sessions can leave it
		-- half-written. A corrupt cache makes the dashboard assert and never draw,
		-- so reset it to an empty list before the plugin reads it.
		local path = vim.fn.stdpath("cache") .. "/dashboard/cache"
		local fd = io.open(path, "r")
		if not fd then
			return
		end
		local data = fd:read("*a"):gsub("%z", "")
		fd:close()
		local chunk = loadstring(data)
		local ok, list = pcall(chunk or error)
		if not (chunk and ok and type(list) == "table") then
			local out = io.open(path, "w")
			if out then
				out:write("return {}")
				out:close()
			end
		end
	end,
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
