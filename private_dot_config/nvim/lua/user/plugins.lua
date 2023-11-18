-- provide plugin manager 'lazy'
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- lazy plugins
require("lazy").setup({
  -- plugins here
  "Mofiqul/dracula.nvim", {
    "Mofiqul/dracula.nvim",
    name = "dracula"
  },
  "ryanoasis/vim-devicons",
  "honza/vim-snippets",
  "scrooloose/nerdtree",
  "preservim/nerdcommenter",
  "mhinz/vim-startify",
  "neoclide/coc.nvim", {
    "neoclide/coc.nvim",
    branch = "release"
  },
  "tpope/vim-surround",
  "farmergreg/vim-lastplace"
})
