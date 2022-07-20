local status_ok, neotest = pcall(require, "neotest")
if not status_ok then
    return
end

local M = {}

function M.post()
  neotest.setup({
    icons = {
      running = "↻",
    },
    status = {
      virtual_text = true,
      signs = false,
    },
    strategies = {
      integrated = {
        width = 180,
      },
    },
    adapters = {
      require("neotest-python")({
        dap = { justMyCode = false, console = "integratedTerminal" },
      }),
      require("neotest-plenary"),
      require("neotest-vim-test")({
        allow_file_types = { "ruby", "typescript" },
      }),
    },
  })
end

return M