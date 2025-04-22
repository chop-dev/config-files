-- ~/.config/lvim/config.lua

-- General Neovim options
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.shiftwidth = 2         -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2            -- insert 2 spaces for a tab
vim.opt.relativenumber = true    -- relative line numbers
vim.opt.guicursor = "i:block"    --  set cursor of insert mode as block.
vim.opt.foldmethod = "indent"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldcolumn = "0"     -- no extra colum used to display info on fold
vim.opt.foldtext = ""        -- first line of folding will remain syntax highlight
vim.opt.foldlevel = 99       -- fold status will not be save when u re-enter the file
vim.opt.foldlevelstart = 99  -- there will be no fold once we visit a file

-- LunarVim options
lvim.colorscheme = "hybrid"
lvim.transparent_window = true

-- Custom Header - Currently my company's name
lvim.builtin.alpha.dashboard.section.header.val = {
    "                                                                                                   ",
    "                                                                                                   ",
    "                                                                                                   ",
    "                                                                                                   ",
    "                                                                                                   ",
    "   ▄████████    ▄████████ ███    █▄     ▄████████     ███      ▄█        ▄█  ███▄▄▄▄      ▄█   ▄█▄ ",
    "  ███    ███   ███    ███ ███    ███   ███    ███ ▀█████████▄ ███       ███  ███▀▀▀██▄   ███ ▄███▀ ",
    "  ███    █▀    ███    ███ ███    ███   ███    █▀     ▀███▀▀██ ███       ███▌ ███   ███   ███▐██▀   ",
    " ▄███▄▄▄       ███    ███ ███    ███   ███            ███   ▀ ███       ███▌ ███   ███  ▄█████▀    ",
    "▀▀███▀▀▀     ▀███████████ ███    ███ ▀███████████     ███     ███       ███▌ ███   ███ ▀▀█████▄    ",
    "  ███          ███    ███ ███    ███          ███     ███     ███       ███  ███   ███   ███▐██▄   ",
    "  ███          ███    ███ ███    ███    ▄█    ███     ███     ███▌    ▄ ███  ███   ███   ███ ▀███▄ ",
    "  ███          ███    █▀  ████████▀   ▄████████▀     ▄████▀   █████▄▄██ █▀    ▀█   █▀    ███   ▀█▀ ",
    "                                                              ▀                          ▀         ",
    "                                                                                                   ",
    "                                                                                                   ",
    "                                                                                                   ",
    "                                                                                                   ",
    "                                                                                                   ",
}

-- Null-ls setup for linters and formatters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "eslint", filetypes = { "typescript", "typescriptreact", "tsx", "jsx" } },
}

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "prettier",
    filetypes = { "typescript", "typescriptreact", "tsx", "jsx" },
  },
}

-- Setup for the tailwindcss language server via lspconfig
require("lvim.lsp.manager").setup("tailwindcss", {
  filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact", "tsx", "jsx" },
  root_dir = require("lspconfig.util").find_git_ancestor,
})

-- Configuration for the tailwindcss language server
local configs = require("lspconfig.configs")
configs.tailwindcss = {
  default_config = {
    cmd = { "tailwindcss-language-server", "--stdio" },
    filetypes = { "html", "css", "javascript", "typescript", "typescriptreact", "tsx", "jsx", "js", "ts" },
    root_dir = require("lspconfig.util").find_git_ancestor,
    single_file_support = true,
  },
}

-- Configure nvim-cmp to include the tailwind colorizer
lvim.builtin.cmp.sources = {
  { name = "nvim_lsp" },
  { name = "luasnip" },
  { name = "buffer" },
  { name = "path" },
  { name = "cmp_git" },
  { name = "tailwindcss-colorizer-cmp" }, -- Ensure this line is present
}

-- You might also want to ensure the colorizer is included in the mapping for showing the completion menu
-- This is an example, LunarVim might have default mappings. Adjust if needed.
local cmp = require("cmp")
lvim.builtin.cmp.mapping = vim.tbl_extend(
  'keep',
  lvim.builtin.cmp.mapping,
  {
    ["<C-Space>"] = cmp.mapping.complete(),
  }
)

-- Additional plugins
lvim.plugins = {
  { "ThePrimeagen/vim-be-good" },
  { "HoNamDuong/hybrid.nvim" },
  { "mlaursen/vim-react-snippets" },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "lua",
          "javascript",
          "typescript",
          "tsx",
        },
        highlight = { enable = true },
        indent = { enable = true },
      }
    end,
  },
  { "roobert/tailwindcss-colorizer-cmp.nvim", config = function()
      require("tailwindcss-colorizer-cmp").setup {
        color_square_width = 2,
      }
    end,
  },
}
