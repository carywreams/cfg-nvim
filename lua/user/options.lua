local options = {
  backup = false,                          -- creates a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  colorcolumn = "80",                      -- column number to highlight
  -- colorcolumn = "120",
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- always show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 100,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  laststatus = 2,                          -- setting for last window having a status line 
  relativenumber = true,                  -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                            -- display lines as one long line
  scrolloff = 8,                           -- minimum number of screen lines above and below cursor
  sidescrolloff = 8,                       -- with nowrap, the min number of columns to keep left and right of the cursor
  guifont = "monospace:h17",               -- the font used in graphical neovim applications

}

-- netrw is for editing files on remote machine
-- these settings prevent loading of netrw
-- see netrw-noload documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


-- set of flags to improve UX and informational messages from nvim 
vim.opt.shortmess:append "c"

-- set the options from the list above
for k, v in pairs(options) do
  vim.opt[k] = v
end

-- permits cursor movement to wrap end/beginning  of line
vim.cmd "set whichwrap+=<,>,[,],h,l"

-- keywords used in search: not sure how I'd use this... TODO
vim.cmd [[set iskeyword+=-]]

-- influences automatic formatting... TODO
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

-- migrating from my .vimrc

-- vim.cmd "set ignorecase" 
-- @TODO: weird: finds all caps if search for lowercase; not lc if search for all caps

