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

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use "savq/melange-nvim"
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
}
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
} 
  use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
}
  -- autocompletion
use("hrsh7th/nvim-cmp") -- completion pluginq
use("hrsh7th/cmp-buffer") -- source for text in buffer
use("hrsh7th/cmp-path") -- source for file system paths

-- snippets
use("L3MON4D3/LuaSnip") -- snippet engine
use("saadparwaiz1/cmp_luasnip") -- for autocompletion
use("rafamadriz/friendly-snippets") -- useful snippets

  if packer_bootstrap then
    require('packer').sync()
  end
end)
