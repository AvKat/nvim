local map = vim.keymap.set
local dap = require("dap")

map("n", "<leader>dc", function()
  dap.continue()
end)

map("n", "<leader>dr", function()
  dap.repl.toggle()
end)

map("n", "<leader>dK", function()
  require("dap.ui.widgets").hover()
end)

map("n", "<leader>dt", function()
  dap.toggle_breakpoint()
end)

map("n", "<leader>dso", function()
  dap.step_over()
end)

map("n", "<leader>dsi", function()
  dap.step_into()
end)

map("n", "<leader>dl", function()
  dap.run_last()
end)

dap.configurations.scala = {
  {
    type = "scala",
    request = "launch",
    name = "RunOrTest",
    metals = {
      runType = "runOrTestFile",
    },
  },
  {
    type = "scala",
    request = "launch",
    name = "Test Target",
    metals = {
      runType = "testTarget",
    },
  },
}
