return {
	"coder/claudecode.nvim",
	dependencies = { "folke/snacks.nvim" },
	config = true,
	keys = {
		{ "<leader>a", nil, desc = "AI/Claude Code" },
		{ "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
		{ "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
		{ "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
		{ "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
		{ "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
		{ "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
		{ "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude (reuse session)" },
		{
			-- Send selection to a FRESH Claude each time: kill the running claude
			-- process, then ClaudeCodeSend queues the selection + launches a new one.
			"<leader>aS",
			function()
				local cc = require("claudecode")
				local term = require("claudecode.terminal")
				if not cc.state.server then
					cc.start() -- ensure the WebSocket server is up
				end
				local bufnr = term.get_active_terminal_bufnr()
				if bufnr and vim.api.nvim_buf_is_valid(bufnr) then
					vim.api.nvim_buf_delete(bufnr, { force = true }) -- kill old claude -> clean screen
				end
				-- ClaudeCodeSend defers its send; by then the old client has
				-- disconnected, so it queues the selection and spawns a fresh claude.
				vim.cmd("ClaudeCodeSend")
			end,
			mode = "v",
			desc = "Send to Claude (fresh session)",
		},
		{
			"<leader>as",
			"<cmd>ClaudeCodeTreeAdd<cr>",
			desc = "Add file",
			ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
		},
		-- Diff management
		{ "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
		{ "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
	},
}
