-- nvim-treesitter's frozen `master` branch registers its query predicates and
-- directives with `all = false`, a compatibility flag Neovim 0.12 removed.
-- Neovim now always passes each capture as a list of nodes, so these handlers
-- receive a table where they expect a node and crash with
-- "attempt to call method 'range' (a nil value)". That hits any injection that
-- uses them: markdown code fences, html <script>, ruby/bash/php heredocs.
-- Re-register them here with the capture list unwrapped to its node.
local query = vim.treesitter.query
local opts = { force = true }

local html_script_type_languages = {
	["importmap"] = "json",
	["module"] = "javascript",
	["application/ecmascript"] = "javascript",
	["text/ecmascript"] = "javascript",
}

local injection_aliases = { ex = "elixir", pl = "perl", sh = "bash", uxn = "uxntal", ts = "typescript" }

--- Return the single node for a capture, whether Neovim passed a node or a list.
local function node_of(match, id)
	local captured = match[id]
	if type(captured) == "table" then
		return captured[#captured]
	end
	return captured
end

query.add_directive("set-lang-from-mimetype!", function(match, _, bufnr, pred, metadata)
	local node = node_of(match, pred[2])
	if not node then
		return
	end
	local value = vim.treesitter.get_node_text(node, bufnr)
	local configured = html_script_type_languages[value]
	if configured then
		metadata["injection.language"] = configured
	else
		local parts = vim.split(value, "/", {})
		metadata["injection.language"] = parts[#parts]
	end
end, opts)

query.add_directive("set-lang-from-info-string!", function(match, _, bufnr, pred, metadata)
	local node = node_of(match, pred[2])
	if not node then
		return
	end
	local alias = vim.treesitter.get_node_text(node, bufnr):lower()
	metadata["injection.language"] = vim.filetype.match({ filename = "a." .. alias })
		or injection_aliases[alias]
		or alias
end, opts)

query.add_directive("downcase!", function(match, _, bufnr, pred, metadata)
	local id = pred[2]
	local node = node_of(match, id)
	if not node then
		return
	end
	local text = vim.treesitter.get_node_text(node, bufnr, { metadata = metadata[id] }) or ""
	metadata[id] = metadata[id] or {}
	metadata[id].text = string.lower(text)
end, opts)

query.add_predicate("nth?", function(match, _, _, pred)
	local node = node_of(match, pred[2])
	local n = tonumber(pred[3])
	if node and n and node:parent() and node:parent():named_child_count() > n then
		return node:parent():named_child(n) == node
	end
	return false
end, opts)

query.add_predicate("is?", function(match, _, bufnr, pred)
	local node = node_of(match, pred[2])
	if not node then
		return true
	end
	local _, _, kind = require("nvim-treesitter.locals").find_definition(node, bufnr)
	return vim.tbl_contains({ unpack(pred, 3) }, kind)
end, opts)

query.add_predicate("kind-eq?", function(match, _, _, pred)
	local node = node_of(match, pred[2])
	if not node then
		return true
	end
	return vim.tbl_contains({ unpack(pred, 3) }, node:type())
end, opts)
