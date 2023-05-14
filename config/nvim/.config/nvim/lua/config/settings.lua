-- General neovim configuration

-- global options
vim.o.mouse            = "a"  -- Enable mouse
vim.opt.inccommand     = "nosplit"
vim.opt.background     = "dark"
vim.opt.completeopt    = "menuone,noselect"  -- Improve completion
vim.opt.swapfile       = true
vim.opt.smartcase      = true
vim.opt.laststatus     = 2
vim.opt.incsearch      = true
vim.opt.hlsearch       = false  -- Highlight on search
vim.opt.ignorecase     = true
vim.opt.errorbells     = false
vim.opt.scrolloff      = 8
vim.opt.smarttab       = true
vim.opt.backup         = false
vim.opt.splitbelow     = true
vim.opt.splitright     = true
vim.opt.showmode       = false
vim.opt.termguicolors  = true
vim.opt.tabstop        = 2
vim.opt.softtabstop    = 2
vim.opt.shiftwidth     = 2
vim.opt.expandtab      = true
vim.opt.smartindent    = false
vim.o.undofile         = true
vim.o.updatetime       = 250
vim.o.timeout          = true
vim.o.timeoutlen       = 300

-- window-local options
vim.wo.number         = true  -- Make line numbers
vim.opt.relativenumber = true  -- Use relative numbers
vim.opt.cursorline     = true
vim.opt.colorcolumn    = "80"
vim.opt.conceallevel   = 0

-- buffer-local options
vim.opt.textwidth      = 79
vim.opt.swapfile       = false


-- Configure diagnostics messages
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

-- Remove all trailing whitespace on save
local TrimWhiteSpaceGrp = vim.api.nvim_create_augroup("TrimWhiteSpaceGrp", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
    command = [[:%s/\s\+$//e]],
    group = TrimWhiteSpaceGrp,
})

-- Enable spell checking for certain file types
vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    -- { pattern = { "*.txt", "*.md", "*.tex" }, command = [[setlocal spell<cr> setlocal spelllang=en,de<cr>]] }
    {
        pattern = { "*.txt", "*.md", "*.tex" },
        callback = function()
            vim.opt.spell = true
            vim.opt.spelllang = "en"
        end,
    }
)