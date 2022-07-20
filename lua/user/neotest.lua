local status_ok, neotest = pcall(require, "neotest")
if not status_ok then
  return
end

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
      dap = { justMyCode = false },
      runner = "unittest",
    }),
    require("neotest-plenary"),
    require("neotest-vim-test")({
      ignore_file_types = { "python", "vim", "lua" },
    }),
  },
})
