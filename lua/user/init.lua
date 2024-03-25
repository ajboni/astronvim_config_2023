local config = {
	options = {
		opt = {
			keymodel = "startsel", -- Enable starting selection mode with shift + arrow.
		},
	},
	mappings = {
		-- first key is the mode
		n = {
			-- Buffers
			["<Tab>"] = {
				function()
					require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1)
				end,
				desc = "Next buffer",
			},
			["<S-Tab>"] = {
				function()
					require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1))
				end,
				desc = "Previous buffer",
			},
			["<C-w>"] = { "<cmd>:bdelete<cr>" }, -- Close buffer
			-- Global shorcuts
			["<F2>"] = { "<cmd>:Telescope keymaps <cr>" },
			["<F3>"] = { "<cmd>:Telescope commands <cr>" },
			["<F4>"] = { "<cmd>:Telescope current_buffer_fuzzy_find<cr>" },
			["<F5>"] = { "<cmd>:Telescope lsp_document_symbols<cr>" },
			["<F6>"] = { "<cmd>:Telescope lsp_dynamic_workspace_symbols<cr>" },
			-- ["<F7>"] = {  },
			-- ["<F8>"] = {  },
			-- ["<F9>"] = {  },
			-- ["<F10>"] = {  },
			-- ["<F11>"] = {  },
			["<F12>"] = { "gd" },
			-- -- -- Undo/Redo
			["<C-z>"] = { "u" }, --} undo
			-- Telescope
			["<C-p>"] = { "<cmd>:Telescope find_files hidden=false<cr>" },
			["<C-[>"] = { "<cmd>:Telescope oldfiles cwd_only=true <CR>" },
			["f"] = {
				function()
					require("hop").hint_words({ current_line_only = true })
				end,
				desc = "Hop Words Current Line",
			},
			["t"] = {
				function()
					require("hop").hint_words({ current_line_only = true, hint_offset = -1 })
				end,
				desc = "Hop Words Current Line",
			},
			["F"] = {
				function()
					require("hop").hint_char2({ current_line_only = false })
				end,
				desc = "Hop after curror",
			},
		},
		i = {
			-- "fine grained" undo.
			--  https://stackoverflow.com/questions/2895550/how-do-i-get-fine-grained-undo-in-vim
			["<c-z>"] = { "<C-o>u" }, -- Undo
			["<c-v>"] = { "<C-r>+" }, -- Undo
			["<c-s>"] = { "<esc>:w!<cr>", desc = "Save File" }, -- change description but the same command
			["<Space>"] = { "<Space><C-g>u" },
			["<Return>"] = { "<Return><C-g>u" },
			["<c-f>"] = {
				function()
					require("hop").hint_words({ current_line_only = true })
				end,
				desc = "Hop Words Current Line",
			},
		},
		t = {
			-- setting a mapping to false will disable it
			-- ["<esc>"] = false,
		},
		v = {
			["X"] = { '"_dd' },
			["<c-c>"] = { '"+y' }, -- Undo
			["f"] = {
				function()
					require("hop").hint_words({ current_line_only = true })
				end,
				desc = "Hop Words Current Line",
			},
			["F"] = {
				function()
					require("hop").hint_char2({ current_line_only = false })
				end,
				desc = "Hop after curror",
			},
		},
	},
	-- Configure plugins
	plugins = {
		{
			"phaazon/hop.nvim",
			branch = "v2", -- optional but strongly recommended
			config = function()
				-- you can configure Hop the way you like here; see :h hop-config
				require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
			end,
		},
		{
			"ray-x/lsp_signature.nvim",
			event = "BufRead",
			config = function()
				require("lsp_signature").setup()
			end,
		},
	},
}

return config
