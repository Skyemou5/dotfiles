local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.hypr = {
  install_info = {
    url = "https://github.com/luckasRanarison/tree-sitter-hypr",
    files = { "src/parser.c" },
    branch = "master",
  },
  filetype = "hypr",
}

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
  "farmergreg/vim-lastplace",
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      
      local parser_install_dir = vim.fn.stdpath("cache") .. "/treesitters"
      vim.fn.mkdir(parser_install_dir, "p")
      -- Prevents reinstall of treesitter plugins every boot
      vim.opt.runtimepath:append(parser_install_dir)

      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = {},
          sync_install = false,
          parser_install_dir = parser_install_dir,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
  },
  "luckasRanarison/tree-sitter-hypr",
})
