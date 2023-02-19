local config = {
  options = {
    opt = {
      keymodel = "startsel,stopsel" -- Enable starting selection mode with shift + arrow.
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
      ["<F4>"] = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>" },
      ["<F5>"] = { "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>" },
      ["<F6>"] = { "<cmd>lua require('telescope.builtin').lsp_dynamic_work:space_symbols()<cr>" },
      ["<F10>"] = { "<cmd>:Telescope lsp_document_symbols<cr>" },
      ["<F11>"] = { "<cmd>:Telescope lsp_workspace_symbols<cr>" },
      ["<F12>"] = { "gd" },

      -- -- -- Undo/Redo
      ["<C-z>"] = { "u" }, --} undo
      -- map("v", "<C-z>", "u") -- undo
      -- map("n", "<C-y>", ":redo<cr>") -- Redo
      --
      -- -- "fine grained" undo.
      -- -- https://stackoverflow.com/questions/2895551/how-do-i-get-fine-grained-undo-in-vim
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
      ["<S-Tab>"] = { ":BufferLineCyclePrev<CR>" }
      --
    },
    i = {
      ["<C-z>"] = { "<C-o>u" }, -- Undo
      ["<C-s>"] = { "<esc>:w!<cr>", desc = "Save File" }, -- change description but the same command
      ["<Space>"] = { "<Space><C-g>u" },
      ["<Return>"] = { "<Return><C-g>u" }

    },
    t = {
      -- setting a mapping to false will disable it
      -- ["<esc>"] = false,
    },
  },
}

return config
