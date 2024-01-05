vim.diagnostic.config({
	virtual_text = true
})

vim.cmd [[autocmd BufWritePre * silent lua vim.lsp.buf.format()]]
vim.api.nvim_create_user_command("Format", function()
	vim.lsp.buf.format()
end, {})

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		'tsserver',
		'rust_analyzer',
		'lua_ls',
		'pyright',
		'clangd',
	},
})

local on_attach = function(_, bufnr)
	local opts = { buffer = bufnr, remap = false }
	local map = vim.keymap.set

	map("n", "<leader>gd", function() vim.lsp.buf.definition() end, opts)
	map("n", "<leader>gr", function() require('telescope.builtin').lsp_references() end, opts)
	map("n", "<leader>fs", function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end, opts)
	map("n", "K", function() vim.lsp.buf.hover() end, opts)
	map("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	map("n", "[g", function() vim.diagnostic.goto_next() end, opts)
	map("n", "]g", function() vim.diagnostic.goto_prev() end, opts)
	map("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	map("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
	map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
	map("n", "<leader>aa", vim.diagnostic.setqflist)
	map("n", "<leader>ae", function()
		vim.diagnostic.setqflist({ severity = "E" })
	end)
end

local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.default_capabilities()

local default_conf_servers = { 'pyright', 'clangd', 'tsserver', 'rust_analyzer' }
for _, lsp in ipairs(default_conf_servers) do
	lspconfig[lsp].setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end

lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

lspconfig.hls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	root_dir = function(fname)
		return lspconfig.util.root_pattern("*.cabal", "stack.yaml", "cabal.project", "package.yaml", "hie.yaml")(fname) or
				lspconfig.util.path.dirname(fname)
	end,
	haskell = {
		languageServerHaskell = {
			hlintOn = true,
			formattingProvider = "stylish-haskell",
		},
	},
})

-- Basic metals setup
local metals_config = require("metals").bare_config()

metals_config.settings = {
	showImplicitArguments = true,
	excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
}

metals_config.init_options.statusBarProvider = "on"
metals_config.capabilities = capabilities

metals_config.on_attach = function(client, bufnr)
	on_attach(client, bufnr)
	require("metals").setup_dap()
end

-- Autocmd that will actually be in charging of starting the whole thing
local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "scala", "sbt" },
	callback = function()
		require("metals").initialize_or_attach(metals_config)
	end,
	group = nvim_metals_group,
})
