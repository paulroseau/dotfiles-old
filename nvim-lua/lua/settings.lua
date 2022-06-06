-- General
vim.opt.textwidth = 80                       -- lines length limit (0 if no limit)
vim.opt.showmatch = true                     -- shows matching parenthesis
vim.opt.matchtime = 2                        -- time during which the matching parenthesis is shown
vim.opt.linebreak = true                     -- don't cut lines in the middle of a word
vim.opt.number = true                        -- show line numbers
vim.opt.numberwidth = 1                      -- minimum line number column width.
vim.opt.listchars = { tab = '> ', eol = '$' } -- invisible characters representation when :set list (unfotunately lua 5.1 does not support UTF-8 character such as { space = '▸', eol = '↲' }
vim.opt.clipboard = 'unnamedplus'            -- copy/paste to/from clipboard provider (xclip, pbcopy, etc.)
vim.opt.cursorline = true                    -- highlight line cursor is currently on
vim.opt.completeopt:append { "noinsert" }    -- select the first item of popup menu automatically without inserting it

-- Search
vim.opt.ignorecase = true -- case insensitive
vim.opt.smartcase = true  -- case insensitive if no uppercase letter in pattern, case sensitive otherwise
vim.opt.wrapscan = false  -- don't go back to first match after the last match is found.

-- Fold
vim.opt.foldmethod = 'indent'
vim.opt.foldlevelstart = 1
-- TODO check for tree-sitter plugin and use it instead, the above should be the default

-- Indentation
vim.opt.autoindent = true
vim.opt.smartindent = true
-- TODO check for tree-sitter plugin and use it instead, the above should be the default

-- Tabs
vim.opt.expandtab = true    -- tab transformed in spaces
vim.opt.tabstop = 2         -- tab correspond to x spaces and vice-versa depending on whether expandtab is on
vim.opt.softtabstop = 2     -- column offset when PRESSING the tab key or the backspace key
vim.opt.shiftwidth = 2      -- column offset when using keys '>' and '<' in normal mode
