return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")
			local mason_tool_installer = require("mason-tool-installer")

			-- Mason setup
			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			-- Ensure LSP servers are installed
			mason_lspconfig.setup({
				ensure_installed = {
					-- "ruby_lsp", this causes duplicate
					-- "standardrb",
					"ts_ls",
					"tailwindcss",
					"html",
					"cssls",
					"lua_ls",
				},
			})

			-- Ensure tools are installed
			mason_tool_installer.setup({
				ensure_installed = {
					"prettier", -- prettier formatter
					"stylua", -- lua formatter
					"eslint_d", -- javascript/typescript linter
					"standardrb", -- javascript/typescript linter
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
			{ "folke/neodev.nvim", opts = {} },
		},
		config = function()
			local lspconfig = require("lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local keymap = vim.keymap

			-- Define capabilities
			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				cmp_nvim_lsp.default_capabilities()
			)

			-- Keybindings for LSP functionality
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local opts = { buffer = ev.buf, silent = true }

					-- General LSP keybindings
					keymap.set("n", "K", vim.lsp.buf.hover, opts)
					keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					keymap.set("n", "gr", vim.lsp.buf.references, opts)
					keymap.set("n", "ca", vim.lsp.buf.code_action, opts)
					keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
					keymap.set("n", "rn", vim.lsp.buf.rename, opts)
				end,
			})

			-- Server-specific configurations
			local servers = {
				ts_ls = {
					capabilities = capabilities,
					init_options = {
						preferences = {
							disableSuggestions = true, -- kills suggestion diagnostics
						},
						diagnostics = {
							ignoredCodes = { 80001, 6133, 7027, 7016 }, -- optional, silence more tsserver noise
						},
					},
					handlers = {
						["textDocument/publishDiagnostics"] = function() end, -- ← FULLY DISABLES LSP DIAGNOSTICS
					},
				},
				ruby_lsp = {
					cmd = { "/Users/mergul/.rbenv/shims/ruby-lsp" },
					capabilities = capabilities,
					init_options = {
						enabledFeatures = {
							diagnostics = true,
							formatting = nil,
						},
						linters = { "standard" },
						addonSettings = {
							["Ruby LSP Rails"] = {
								enablePendingMigrationsPrompt = false,
							},
						},
					},
				},
			}

			-- Apply server configurations
			for server, config in pairs(servers) do
				lspconfig[server].setup(vim.tbl_extend("force", {
					capabilities = capabilities,
				}, config))
			end
		end,
	},
}
