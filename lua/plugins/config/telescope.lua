-- vim: ts=2 sw=2 et:

local actions = require('telescope.actions')
local telescope = require('telescope')

telescope.setup {
  defaults = {
    prompt_position = 'bottom',
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    color_devicons = true,
    use_less = true,
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    buffer_previewer_maker= require('telescope.previewers').buffer_previewer_maker
  }
}

vim.api.nvim_set_keymap('n', '<Leader>ob', ':Telescope buffers<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>of', ':Telescope find_files<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>og', ':Telescope git_files<CR>', {})
-- vim.api.nvim_set_keymap('n', '<Leader>', ':Telescope <CR>', {})
