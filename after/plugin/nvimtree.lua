local function on_attach(bufnr)
	local api = require('nvim-tree.api')

	local function opts(desc)
		return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	api.config.mappings.default_on_attach(bufnr)

	vim.keymap.set('n', 'u', api.tree.change_root_to_parent, opts('Up'))
	vim.keymap.set('n', 'C', api.tree.change_root_to_node, opts('CD'))
end


require("nvim-tree").setup({
	sort_by = "case_sensitive",
	on_attach = on_attach,
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		custom = { "node_modules", "^\\.git$" },
	},
})

vim.keymap.set("n", "<leader>n", vim.cmd.NvimTreeToggle)
