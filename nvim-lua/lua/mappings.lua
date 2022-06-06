vim.g.mapleader = ','
vim.opt.timeoutlen = 700 -- time in milliseconds that is waited for the next mapping key

-- Esc
vim.keymap.set({'', '!'} , '<leader>m', '<Esc>')

-- Navigate inside a wrapped line
vim.keymap.set({''} , '<up>', ':normal! gk<CR>', { silent = true })
vim.keymap.set({''} , '<down>', ':normal! gj<CR>', { silent = true })

-- Window switching
vim.keymap.set({'n'} , '<M-h>', '<C-w>h')
vim.keymap.set({'n'} , '<M-j>', '<C-w>j')
vim.keymap.set({'n'} , '<M-k>', '<C-w>k')
vim.keymap.set({'n'} , '<M-l>', '<C-w>l')

-- Window moving
vim.keymap.set({'n'} , '<M-H>', '<C-w>H')
vim.keymap.set({'n'} , '<M-J>', '<C-w>J')
vim.keymap.set({'n'} , '<M-K>', '<C-w>K')
vim.keymap.set({'n'} , '<M-L>', '<C-w>L')
vim.keymap.set({'n'} , '<M-x>', '<C-w>x')

-- Window resizing
vim.keymap.set({'n'} , '<M-=>', '<C-w>=')
vim.keymap.set({'n'} , '<M-+>', '<C-w>+')
vim.keymap.set({'n'} , '<M-->', '<C-w>-')
vim.keymap.set({'n'} , '<M->>', '<C-w>>')
vim.keymap.set({'n'} , '<M-<>', '<C-w><')

-- Window creating
vim.keymap.set({'n'} , '<M-n>', '<C-w>n')
vim.keymap.set({'n'} , '<M-s>', '<C-w>s')
vim.keymap.set({'n'} , '<M-v>', '<C-w>v')
vim.keymap.set({'n'} , '<M-]<', '<C-w>g<C-]>')

-- Window closing
vim.keymap.set({'n'} , '<M-c>', '<C-w>c')
vim.keymap.set({'n'} , '<M-o>', '<C-w>o')

-- Buffer switching {{{3
vim.keymap.set({'n'} , '<C-l>', ':bn<CR>')
vim.keymap.set({'n'} , '<C-h>', ':bp<CR>')

-- Toggle search highlighting
vim.keymap.set({''} , '<leader>,', ':set hlsearch!<CR>', { silent = true })
