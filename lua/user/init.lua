local hop = require("hop")
local hopDirections = require("hop.hint").HintDirection
local config = {
	options = {
		opt = {
			keymodel = "startsel", -- Enable starting selection mode with shift + arrow.
		},
	},
	mappings = {
		-- first key is the mode
		n = {
			-- second key is the lefthand side of the map
			-- mappings seen under group name "Buffer"
			-- ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
			-- ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
			-- ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
			-- ["<leader>bt "] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
			-- ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command

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
			-- map("v", "<C-z>", "u") -- undo
			-- map("n", "<C-y>", ":redo<cr>") -- Redo
			--

			-- -- -- Navigate through buffers
			-- map("n", "<C-s>", ":w<cr>") -- Save buffer
			-- map("i", "<C-s>", "<Esc>:w<cr>") -- Save buffer
			-- map("n", "<C-e>", "<C-w>") -- Close buffer
			["<C-w>"] = { "<cmd>:bdelete<cr>" }, -- Close buffer
			--
			-- Telescope
			["<C-p>"] = { "<cmd>:Telescope find_files hidden=false<cr>" },
			["<C-[>"] = { "<cmd>:Telescope oldfiles cwd_only=true <CR>" },
			["<Tab>"] = { ":BufferLineCycleNext<CR>" },
			["<S-Tab>"] = { ":BufferLineCyclePrev<CR>" },
			["f"] = {
				function()
					hop.hint_char2({ current_line_only = true })
				end,
				desc = "Hop after curror",
			},
			["F"] = {
				function()
					hop.hint_char1({ direction = hopDirections.BEFORE_CURSOR, current_line_only = true })
				end,
			},
			-- vim.keymap.set('', 't', function()
			--   hop.hint_char1({ direction = hopDirections.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
			-- end, { remap = true })
			-- vim.keymap.set('', 'T', function()
			--   hop.hint_char1({ direction = hopDirections.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
			-- end, { remap = true })
		},
		i = {
			-- "fine grained" undo.
			--  https://stackoverflow.com/questions/2895551/how-do-i-get-fine-grained-undo-in-vim
			["<C-z>"] = { "<C-o>u" }, -- Undo
			["<C-v>"] = { "<C-r>+" }, -- Undo
			["<C-s>"] = { "<esc>:w!<cr>", desc = "Save File" }, -- change description but the same command
			["<Space>"] = { "<Space><C-g>u" },
			["<Return>"] = { "<Return><C-g>u" },
		},
		t = {
			-- setting a mapping to false will disable it
			-- ["<esc>"] = false,
		},
		v = {
			["<C-c>"] = { "\"+y" }, -- Undo
		}

	},
	-- Configure plugins
	plugins = {
		init = {
			{
				"phaazon/hop.nvim",
				branch = "v2", -- optional but strongly recommended
				config = function()
					-- you can configure Hop the way you like here; see :h hop-config
					require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
				end,
			},
		},
	},
}

return config
