-- require('telescope').setup{
--   defaults = {
--     mappings = {
--       i = {
--         ["<C-j>"] = require('telescope.actions').move_selection_next,
--         ["<C-k>"] = require('telescope.actions').move_selection_previous,
--         ["<C-q>"] = require('telescope.actions').move_selection_previous,
--       },
--     },
--   }
-- }
-- 
-- local builtin = require('telescope.builtin');
-- 
-- vim.keymap.set('n', 'fs', builtin.find_files, {});
-- 
-- 
-- vim.keymap.set('n', 'ts', function()
--      builtin.grep_string({ search = vim.fn.input("Search > ") });
-- end);


local telescope_setup, telescope = pcall(require, "telescope")

if not telescope_setup then
  return
end

local actions_setup, actions = pcall(require, "telescope.actions")

if not actions_setup then
  return 
end

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
      }
    }
  }
})

telescope.load_extension("fzf")
