" vim:foldmethod=marker
" GENERAL {{{1
" SETTINGS {{{2
" Miscallenous {{{3
set hidden                      " Hide files when leaving them.
set number                      " Show line numbers.
set numberwidth=1               " Minimum line number column width.
set textwidth=80                " Lines length limit (0 if no limit).
set formatoptions=jtcrq         " Sensible default line auto cutting and formatting.
set linebreak                   " Don't cut lines in the middle of a word .
set showmatch                   " Shows matching parenthesis.
set matchtime=2                 " Time during which the matching parenthesis is shown.
set background=dark             " Color adapted to dark background.
set statusline=%f\ %m%=[%l/%L]  " Status line (filename [modified] ...  [currentLine / totalLines])
set listchars=tab:▸\ ,eol:¬     " Invisible characters representation when :set list.
set clipboard=unnamedplus       " Copy/Paste to/from clipboard
set cursorline                  " Highlight line cursor is currently on
set completeopt+=noinsert       " Select the first item of popup menu automatically without inserting it
set inccommand=nosplit          " Interactively shows the effect of a command (for example substitute)

" Search {{{3
set incsearch  " Incremental search.
set ignorecase " Case insensitive.
set smartcase  " Case insensitive if no uppercase letter in pattern, case sensitive otherwise.
set nowrapscan " Don't go back to first match after the last match is found.

" Fold {{{3
set foldmethod=indent
set foldlevelstart=1

" Indentation {{{3
set autoindent
set smartindent

" Tabs {{{3
set expandtab     " Tab transformed in spaces
set tabstop=2     " Sets tab character to correspond to x columns.
                  " x spaces are automatically converted to <tab>.
                  " If expandtab option is on each <tab> character is converted to x spaces.
set softtabstop=2 " column offset when PRESSING the tab key or the backspace key.
set shiftwidth=2  " column offset when using keys '>' and '<' in normal mode.

" MAPPINGS {{{2

let mapleader = ","
set timeoutlen=700 " time in milliseconds that is waited for the next mapping key

" <Esc> {{{3
noremap <leader>m <Esc>
inoremap <leader>m <Esc>
cnoremap <leader>m <Esc>
tnoremap <leader>m <C-\><C-n> 

" Navigate inside a wrapped line {{{3
noremap <Up> :normal! gk<CR>
noremap <Down> :normal! gj<CR>

" Handle window actions with Meta instead of <C-w> {{{3
" Switching
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l

" Moving
nnoremap <M-H> <C-w>H
nnoremap <M-J> <C-w>J
nnoremap <M-K> <C-w>K
nnoremap <M-L> <C-w>L
nnoremap <M-x> <C-w>x

" Resizing
nnoremap <M-=> <C-w>=
nnoremap <M-+> <C-w>+
nnoremap <M--> <C-w>-
nnoremap <M-<> <C-w><
nnoremap <M->> <C-w>>

" Creating
nnoremap <M-n> <C-w>n
nnoremap <M-s> <C-w>s
nnoremap <M-v> <C-w>v
nnoremap <M-]> <C-w>g<C-]>

" Closing
nnoremap <M-c> <C-w>c
nnoremap <M-o> <C-w>o

" Quickfix
nnoremap <M-Enter> <C-w><CR>

" Tabs
nnoremap <silent> <M-t> <C-w>T:tabnext<CR>

" Switch between buffers {{{3
nnoremap <C-k> :bn<CR>
nnoremap <C-j> :bp<CR>

" Tags {{{3
" Displays the list of multiple match for a tag by default.
" <C-]> is mapped to :tag <current_word> (jump to the first match) by default.
" g<C-]> is mapped to :tjump <current_word> (displays the list if multiple matches exist)
nnoremap <C-]> g<C-]>

" Quickfix list {{{3
noremap <silent> <S-l> :cprevious<CR>
noremap <silent> <S-h> :cnext<CR>

" More/Less foldlevel {{{3
nnoremap <M-r> zr
nnoremap <M-e> zm

" Toggle current fold {{{3
nnoremap <Space> zA

" Clipboard {{{3
inoremap <C-r>e <C-r>+
cnoremap <C-r>e <C-r>+

function! ClipboardUseToggle()
  if &clipboard ==# "unnamedplus"
    set clipboard=""
  else
    set clipboard=unnamedplus
  endif
  echom "clipboard=" . &clipboard
endfunction
nnoremap <silent> <leader>r :call ClipboardUseToggle()<CR>

" Remove search highlighting {{{3
nnoremap <silent> <leader>, :nohlsearch<CR>

" Clear command line {{{3
nnoremap <C-\> :<BS>

" Redraws the screen {{{3
nnoremap <leader>d :redraw!<CR>

" Toggle display of tabs and EOF {{{3
nnoremap <leader>l :set list!<CR>

" Remove trailing whitespace {{{3
" use of '<silent>' to hide what would be output on the command line
" use of ':silent!' to hide error message when pattern is not found
nnoremap <silent> <leader>w :silent! execute '/\v( )+$'<CR>
nnoremap <silent> <leader>W :silent! execute '%substitute/\v( )+$//'<CR>

" TODO make a wrapper that saves current position, current jumplist, etc.
" executes a command (namely here substitution), jumps back to current position
" and delete what has been appended to jumplist.
" function! PreservePosition(f)

" Modify init.vim easily {{{3
nnoremap <leader>ev :edit $MYVIMRC<CR>:<BS>
nnoremap <leader>sv :source $MYVIMRC<CR>:echo $MYVIMRC "reloaded"<CR>


" Auto-commands {{{1
" Vimscript {{{2
augroup vimscript_augroup
  autocmd!
  autocmd FileType vim nnoremap <buffer> <M-z> :execute "help" expand("<cword>")<CR>
augroup END

" Markdown {{{2
augroup markdown_augroup
  autocmd!
  autocmd FileType markdown setlocal textwidth=0
augroup END

" HCL {{{2
augroup hcl_augroup
  autocmd!
  autocmd BufReadPost *.hcl setlocal filetype=terraform
augroup END

" PLUGINS {{{1
" INSTALL {{{2
let s:NVIM_HOME = "/" . join(split($MYVIMRC, "/")[0 : -2], "/")
let s:PLUGINS_DIR_NAME = "plugged"

call plug#begin(s:NVIM_HOME . "/" . s:PLUGINS_DIR_NAME)
Plug 'altercation/vim-colors-solarized'
Plug 'hashivim/vim-terraform'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'lnl7/vim-nix'
Plug 'mbbill/undotree'
Plug 'nelstrom/vim-visual-star-search'
Plug 'nvim-lua/plenary.nvim'
Plug 'plasticboy/vim-markdown'
Plug 'scalameta/nvim-metals', { 'branch': 'main' }
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" SETTINGS {{{2
" Airline {{{3
let g:airline_theme='solarized'
let g:airline_powerline_fonts=0

" Deoplete {{{3
let g:deoplete#enable_at_startup = 1

" Solarized {{{3
silent! colorscheme solarized " ignore failure if the solarized colorscheme has not been installed yet

" MAPPINGS {{{2
" FZF {{{3
" Use FZF tags in order to select more easily the best candidate
nnoremap <C-t> :execute "Tags" expand("<cword>")<CR>

" NERDTree {{{3
nnoremap <silent> <leader>t :NERDTreeToggle<CR>
nnoremap <silent> <leader>f :NERDTreeFind <CR>

" Undotree {{{3
nnoremap <leader>u :UndotreeToggle<CR>

" Terraform {{{3
let g:terraform_fmt_on_save=1

" AUGROUPS {{{2
" Fugitive {{{3
augroup fugitive_plugin
  autocmd!
  autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

lua require'scala_metals'
