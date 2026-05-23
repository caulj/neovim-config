return {
	-- Neovim LSP Configuration Plugin
	{
		"neovim/nvim-lspconfig",
	},
	--------------------------------------------------------------
	-- Mason LSP Mananger Plugin
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		version = "^1.0.0",
	},
	--------------------------------------------------------------
	-- Mason LSP Configuration Tool Plugin
	{
		"williamboman/mason-lspconfig.nvim",
		version = "^1.0.0",
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
		},
		main = "mason-lspconfig",
		config = function()
			require("mason").setup({
				PATH = "append",
			})
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"cmake",
					"pyright",
					"clangd",
					"rust_analyzer",
				},
				automatic_installation = true,
			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			require("mason-lspconfig").setup_handlers({
				-- Default Language Server Setup
				function(server_name)
					vim.lsp.config(server_name, {
						capabilities = capabilities,
					})
					vim.lsp.enable(server_name)
				end,
				-- Lua Language Server Setup
				["lua_ls"] = function()
					vim.lsp.config("lua_ls", {
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = { globals = { "vim" } },
								workspace = {
									library = { vim.env.VIMRUNTIME },
									checkThirdParty = false,
								},
							},
						},
					})
					vim.lsp.enable("lua_ls")
				end,
				-- C/C++ Language Server Setup
				["clangd"] = function()
					vim.lsp.config("clangd", {
						cmd = { "clangd", "--background-index", "--clang-tidy" },
						capabilities = capabilities,
					})
					vim.lsp.enable("clangd")
				end,
				-- CMake Language Server Setup
				["cmake"] = function()
					vim.lsp.config("cmake", {
						capabilities = capabilities,
					})
					vim.lsp.enable("cmake")
				end,
				-- Rust Language Server Setup
				["rust_analyzer"] = function()
					vim.lsp.config("rust_analyzer", {
						capabilities = capabilities,
						settings = {
							["rust-analyzer"] = {},
						},
					})
					vim.lsp.enable("rust_analyzer")
				end,
				-- Add More Language Servers Here
			})
		end,
	},
}
