require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = require('telescope.actions').move_selection_next,
        ["<C-k>"] = require('telescope.actions').move_selection_previous,
      },
    },
  }
}

local builtin = require('telescope.builtin');

vim.keymap.set('n', 'fs', builtin.find_files, {});


vim.keymap.set('n', 'ts', function()
     builtin.grep_string({ search = vim.fn.input("Search > ") });
end);

