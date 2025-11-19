vim.cmd("let g:loaded_ruby_provider = 0")

-- to make Ruby work on multiple versions in diff projects
vim.env.PATH = os.getenv("HOME") .. "/.rbenv/shims:" .. vim.env.PATH

local opt = vim.opt
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.termguicolors = true

-- Syntax highlighting on
vim.cmd("syntax on")
vim.cmd("set nocompatible")

-- Set language this is must for yanking in UTF format
vim.cmd("language en_US.UTF-8")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
--
-- Set terminal color support to 256 colors
-- vim.opt.t_Co = 256

-- Set encoding to UTF-8
vim.opt.encoding = "utf-8"

-- Disable error bells
vim.opt.errorbells = false

-- Show line numbers
vim.opt.number = true

-- Show relative line numbers
vim.opt.relativenumber = true

-- Enable auto-indentation
vim.opt.autoindent = true

-- Always show status line
vim.opt.laststatus = 2

-- Enable system clipboard integration
vim.opt.clipboard:append("unnamedplus")

-- Set tabstop, shiftwidth, and softtabstop
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 4

-- Disable displaying invisible characters
vim.opt.list = true

-- Set fold level and method using treesitter
vim.opt.foldlevel = 20
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Enable copying indent from previous line
vim.opt.copyindent = true

-- Set diff options for vertical splits
vim.opt.diffopt:append("vertical")

-- Show sign column
vim.opt.signcolumn = "yes"

-- Reduce command-line height
vim.opt.cmdheight = 1

-- Set leader key to Space
vim.g.mapleader = " "

-- Uncomment below to set highlight color
vim.cmd("highlight Search guibg=peru guifg=wheat")
vim.cmd("highlight CursorColumn guibg=#CCCCCC")

-- Uncomment below to define custom functions
-- Define the Rawecho function
function _G.Rawecho(str)
	local f = io.open("/dev/fd/2", "wb")
	if f then
		f:write(str)
		f:close()
	end
end

-- Prevent jumping when pattern matching
vim.keymap.set("n", "*", function()
	vim.fn.setreg("/", "\\<" .. vim.fn.expand("<cword>") .. "\\>")
	vim.opt.hlsearch = true
end, { silent = true })

vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
vim.lsp.buf.format = function() end
