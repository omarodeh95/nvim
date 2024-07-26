local setup, nvimtree = pcall(require, "nvim-tree")

if not setup then
  return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- icons color
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF]])

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = false, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)
  vim.keymap.set('n', 'f', '', opts('Unbind f'))
  vim.keymap.set('n', 's', '', opts('Unbind s'))

  vim.keymap.set('n', 'ff', ':NvimTreeToggle<CR>', opts('Toggle nvim-tree'))
end

nvimtree.setup({
  on_attach = my_on_attach,
  filters = {
    git_ignored = false, -- This line hides files ignored by git
  },
  renderer = {
    icons = {
      glyphs = {
        folder = {
          arrow_closed = "󰁔", -- arrow when folder is closed
          arrow_open = "", -- arrow when folder is open
        }
      }
    }
  },
  actions = {
    open_file = {
      window_picker = {
        enable = false
      }
    }
  }
})
