return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<leader>F",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	-- This will provide type hinting with LuaLS
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		-- Define your formatters
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			javascript = { "prettier", "prettierd", stop_after_first = true },
			rust = { "rustfmt", lsp_format = "fallback" },
			c = { "clang_format" },
			cpp = { "clang_format" },
			objc = { "clang_format" },
			objcpp = { "clang_format" },
			sh = { "shfmt" },
			bash = { "shfmt" },
			cmake = { "cmake_format" },
			css = { "php_cs_fixer" },
			php = { "php_cs_fixer" },
		},
		-- Set default options
		default_format_opts = {
			lsp_format = "fallback",
		},
		-- Set up format-on-save
		format_on_save = { timeout_ms = 10000 },
		-- Customize formatters
		formatters = {
			clang_format = {
				command = "clang-format",
				args = { "--style", "file", "--fallback-style", "webkit" },
				stdin = true,
			},
			shfmt = {
				prepend_args = { "-i", "2" },
			},
		},
	},
}
