local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerCompile
	augroup end
]])

local status, packer = pcall(require, "packer")

if not status then
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	use("bluz71/vim-nightfly-guicolors") -- preferred colorscheme

  -- split maxmize windo
  use("szw/vim-maximizer")

  -- essential plugins
  -- Surrounding -- ysw" -> add double quote to the motion, csw) -> change the surrounding of motion, ds) delete the double quote
  use("tpope/vim-surround")

  -- Commenting with gc
  use("numToStr/Comment.nvim")

  -- lua functions that many other functions use
  use("nvim-lua/plenary.nvim")

  -- file explorer
  use {
                'nvim-telescope/telescope.nvim', tag = '0.1.8',
                -- or                            , branch = '0.1.x',
                requires = { {'nvim-lua/plenary.nvim'} }
        }

  if packer_bootstrap then
    require('packer').sync()
  end
end)

