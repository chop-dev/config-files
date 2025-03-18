-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.shiftwidth = 2            -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2               -- insert 2 spaces for a tab
vim.opt.relativenumber = true     -- relative line numbers
vim.opt.guicursor = "i:block"     --  set cursor of insert mode as block.
lvim.colorscheme = "hybrid"
lvim.transparent_window = true
vim.opt.foldmethod = "indent"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldcolumn = "0"    -- no extra colum used to display info on fold
vim.opt.foldtext = ""       -- first line of folding will remain syntax highlight
vim.opt.foldlevel = 99      -- fold status will not be save when u re-enter the file
vim.opt.foldlevelstart = 99 -- there will be no fold once we visit a file


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

lvim.plugins = {
  { 'ThePrimeagen/vim-be-good' },
  { 'HoNamDuong/hybrid.nvim' },
  { 'mlaursen/vim-react-snippets' },
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
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      }
    end
  },
}
