local opt = vim.opt
opt.shiftwidth = 4
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4

opt.smartindent = true
opt.wrap = false

opt.mouse = 'a'
opt.title = true

opt.list = true
opt.listchars = { tab = '↦ ', trail = '.' }
opt.fillchars:append({ eob = ' ' })

opt.termguicolors = true

opt.splitbelow = true
opt.splitright = true

opt.ignorecase = true
opt.smartcase = true

opt.spell = true
opt.spelllang = { "en_gb" }

opt.scrolloff = 6
opt.sidescrolloff = 6

opt.confirm = true

opt.undofile = true
opt.backup = true
opt.backupdir:remove('.')
