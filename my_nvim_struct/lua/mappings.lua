require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- Отладка
map("n", "<leader>db", function() require("dap").toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
map("n", "<leader>dr", function() require("dap").continue() end, { desc = "Start/Continue" })
map("n", "<leader>ds", function() require("dap").step_over() end, { desc = "Step Over" })
map("n", "<leader>di", function() require("dap").step_into() end, { desc = "Step Into" })
map("n", "<leader>do", function() require("dap").step_out() end, { desc = "Step Out" })
map("n", "<leader>dt", function() require("dapui").toggle() end, { desc = "Toggle Debug UI" })

-- Go команды
map("n", "<leader>gt", "<cmd>GoTest<CR>", { desc = "Go Test" })
map("n", "<leader>gr", "<cmd>GoRun<CR>", { desc = "Go Run" })
map("n", "<leader>gb", "<cmd>GoBuild<CR>", { desc = "Go Build" })
map("n", "<leader>gi", "<cmd>GoImport<CR>", { desc = "Go Import" })
map("n", "<leader>gf", "<cmd>GoFmt<CR>", { desc = "Go Format" })

-- Терминал
map("n", "<C-\\>", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })
map("t", "<C-\\>", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })

-- Trouble (диагностика)
map("n", "<leader>xx", "<cmd>TroubleToggle<CR>", { desc = "Toggle Trouble" })
map("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", { desc = "Workspace Diagnostics" })
map("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", { desc = "Document Diagnostics" })

-- Symbols Outline
map("n", "<leader>so", "<cmd>SymbolsOutline<CR>", { desc = "Symbols Outline" })

-- Oil файловый браузер - используем функцию напрямую
map("n", "-", function() require("oil").open() end, { desc = "Open parent directory" })
map("n", "<leader>o", function() require("oil").open() end, { desc = "Open Oil file manager" })

-- Todo комментарии
map("n", "<leader>td", "<cmd>TodoTelescope<CR>", { desc = "Find TODOs" })-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<leader>gc", 
  function()
    vim.ui.input({prompt = "Class name: "}, function(input)
      if input then
        require("cpp_generator").create_pair(input)
      end
    end)
  end,
  { desc = "Generate C++ Class Pair"}
)
