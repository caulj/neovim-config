return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	lazy = false,
	priority = 1000,
	main = "lualine",
	opts = {
		options = {
			theme = "dracula",
			icons_enabled = true,
			disabled_filetypes = {
				'lazy',
				'neo-tree',
				'undotree',
			},
		},
	}
}
