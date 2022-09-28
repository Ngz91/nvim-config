vim.g.Illuminate_ftblacklist = { "alpha", "NvimTree", "DressingSelect", "harpoon" }
vim.api.nvim_set_keymap("n", "<a-n>", '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', { noremap = true })
vim.api.nvim_set_keymap(
  "n",
  "A-t",
  '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>',
  { noremap = true }
)