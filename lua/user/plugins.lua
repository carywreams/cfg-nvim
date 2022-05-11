local fn = vim.fn


-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- REMEMBER: use :PackerUpdate if plugins are added
-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim"  -- Have packer manage itself
  use "nvim-lua/popup.nvim"     -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"   -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs"   -- Autopairs, integrates with both cmp and treesitter
  use "lunarvim/colorschemes"   -- A bunch of colorschemes you can try out
  use "lunarvim/darkplus.nvim"
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight

  --  -- LSP
  use "neovim/nvim-lspconfig"             -- p:lsp -- enable LSP
  use "williamboman/nvim-lsp-installer"   -- p:lsp -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim"      -- p:lsp -- language server settings defined in json for

  -- cmp plugins
  -- nvim-cmp suggests these appear after nvim-lspconfig
  use "hrsh7th/cmp-nvim-lsp"      -- p:cmp --  
  use "hrsh7th/cmp-buffer"        -- p:cmp --  buffer completions
  use "hrsh7th/cmp-path"          -- p:cmp --  path completions
  use "hrsh7th/cmp-cmdline"       -- p:cmp --  cmdline completions
  use "hrsh7th/nvim-cmp"          -- p:cmp --  The completion plugin
  use "hrsh7th/cmp-emoji"         -- p:cmp --  
  use "hrsh7th/cmp-nvim-lua"      -- p:cmp --  


  --  LuaSnip snippets
  use "L3MON4D3/LuaSnip"          -- p:luasnip -- snippet engine
  use "saadparwaiz1/cmp_luasnip"  -- p:luasnip -- snippet completions

  -- this could be interesting if I begin to rely on my own snippets
  -- use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "filipdutescu/renamer.nvim"
  use "simrat39/symbols-outline.nvim"
  use "ray-x/lsp_signature.nvim"

  --
  -- Telescope
  use "nvim-telescope/telescope.nvim"                 -- p:telescope -- finder
  use "tom-anders/telescope-vim-bookmarks.nvim"       -- p:telescope -- picker
  use "nvim-telescope/telescope-media-files.nvim"     -- p:telescope -- file previews from within nvim
  use "nvim-telescope/telescope-ui-select.nvim"       -- p:telescope -- sets vim hook
  use "nvim-telescope/telescope-file-browser.nvim"    -- p:telescope -- file  browser 

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",                -- p:treesitter -- 
    run = ":TSUpdate",
  }
  use {
    "nvim-treesitter/playground",                     -- p:treesitter -- 
    run = ":TSInstall query",
  }
  use "romgrk/nvim-treesitter-context"                -- p:treesitter -- 

  --  -- Git
  use "lewis6991/gitsigns.nvim"                       -- p:git --
  -- use "f-person/git-blame.nvim"                       -- p:git --

  -- DAP - Debug Adapter Protocol plugins from suggested list may be interesting here 

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
