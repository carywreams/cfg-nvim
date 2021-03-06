-- tag: generation_00

-- put out a couple of checkhealth fires to clean up the report
require "user.warning_suppression"

-- mostly sets specific config values
require "user.options"

-- customized keyboard shortcut settings 
require "user.keymaps"

-- place to have nvim load resources from repos
-- user :PackerUpdate to re-init
require "user.plugins"

-- the **_config files provide configuration for plugins
require "user.nvim_autopairs_config"

-- tag: generation_01
require "user.autocommands"
require "user.lunarvim_colorschemes_config"

-- tag: generation_02
-- moving lsp up a lot
-- expecting trouble
require "user.hrsh7th_nvim_cmp_config"
require "user.filipdutescu_renamer_config"
require "user.lsp"


-- tag: generation_03
require "user.nvim_telescope_config"
require "user.nvim_treesitter_config"
-- git support start
-- require "user.f_person_git_blame_config"
require "user.lewis6991_gitsigns_config"
-- git support stop

-- tag: generation_04
require "user.akinsho_bufferline"
require "user.smiteshp_nvim-gps"
require "user.nvim_lualine_config"
