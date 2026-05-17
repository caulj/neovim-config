return {
	'hrsh7th/nvim-cmp',
	-----------------------------------
	-- Dependencies for NVim Completion
	dependencies = {
		'neovim/nvim-lspconfig',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',

		-- LuaSnip Completion Engine
		'saadparwaiz1/cmp_luasnip',
		{
			"L3MON4D3/LuaSnip",
			dependencies = { "rafamadriz/friendly-snippets" },
			-- follow latest release.
			version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
			-- install jsregexp (optional!).
			build = "make install_jsregexp",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},

		-- Added VsCode Like Pictograms for Completion
		'onsails/lspkind.nvim'
	},
	------------------------------------
	event = 'InsertEnter',
	config = function()
		local cmp = require('cmp')
		local lspkind = require('lspkind')

		cmp.setup({

			snippet = {
				-- REQUIRED - you must specify a snippet engine
				expand = function(args)
					require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
				end,
			},

			sorting = {
				-- TODO: Would be cool to add stuff like "See variable names before method names" in rust, or something like that.
				comparators = {
					cmp.config.compare.offset,
					cmp.config.compare.exact,
					cmp.config.compare.score,

					-- copied from cmp-under, but I don't think I need the plugin for this.
					-- I might add some more of my own.
					function(entry1, entry2)
						local _, entry1_under = entry1.completion_item.label:find "^_+"
						local _, entry2_under = entry2.completion_item.label:find "^_+"
						entry1_under = entry1_under or 0
						entry2_under = entry2_under or 0
						if entry1_under > entry2_under then
							return false
						elseif entry1_under < entry2_under then
							return true
						end
					end,

					cmp.config.compare.kind,
					cmp.config.compare.sort_text,
					cmp.config.compare.length,
					cmp.config.compare.order,
				},
			},

			window = {
				-- completion = cmp.config.window.bordered(),
				-- documentation = cmp.config.window.bordered(),
			},

			mapping = cmp.mapping.preset.insert({
				["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
				["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),

				['<C-b>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),

				['<C-Space>'] = cmp.mapping.complete(),
				['<C-e>'] = cmp.mapping.abort(),
				['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			}),

			sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'nvim_lua ' },
					{ name = 'luasnip' }, -- For luasnip users.
				},
				{
					{ name = 'buffer' },
					{ name = 'path' },
				}),

			formatting = {
				format = lspkind.cmp_format {
					with_text = true,
					menu = {
						buffer   = "[Buf]",
						nvim_lsp = "[LSP]",
						nvim_lua = "[API]",
						path     = "[Path]",
						luasnip  = "[Snip]",
						-- gh_issues = "[issues]",
						-- tn = "[TabNine]",
						-- eruby = "[erb]",
					},
				},
			},

			experimental = {
				native_menu = false,
				ghost_text = true,
			},
		})

		-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
		-- Set configuration for specific filetype.
		--[[ cmp.setup.filetype('gitcommit', {
		sources = cmp.config.sources({
				{ name = 'git' },
			}, {
				{ name = 'buffer' },
			})
		})
		require("cmp_git").setup() ]] --

		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ '/', '?' }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = 'buffer' }
			}
		})

		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline(':', {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = 'path' }
			}, {
				{ name = 'cmdline' }
			}),
			matching = { disallow_symbol_nonprefix_matching = false }
		})
	end,
}
