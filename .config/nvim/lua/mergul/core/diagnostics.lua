-- Diagnostic display. Neovim 0.11+ turns virtual text off by default and never
-- refreshes diagnostics while in insert mode, so nothing looked "live".
vim.diagnostic.config({
	-- inline message at the end of the offending line
	virtual_text = {
		spacing = 2,
		prefix = "●",
		source = "if_many", -- show the source only when more than one reports on the line
	},
	update_in_insert = true, -- refresh while typing (ruby_lsp pulls on every change)
	underline = true,
	severity_sort = true,
	signs = true,
	float = { border = "rounded", source = "if_many" },
})
