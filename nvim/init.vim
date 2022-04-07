"lua <<EOF
"print('hello from lua')
"EOF
" vim rc !


set clipboard+=unnamedplus
set nocompatible
filetype off
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set exrc
set nu
set relativenumber
set nohlsearch
set hidden
"set path+=**
set noerrorbells
"set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=26
"set colorcolumn=100
set signcolumn=yes
set cmdheight=2
set encoding=UTF-8
inoremap kj <ESC>
inoremap KJ <ESC>

" copy and paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa


lua require("bozilla.settings")
"let mapleader = " "
nnoremap <Leader>s :e $USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json<cr>
nnoremap <Leader>v :e $MYVIMRC<cr>
nnoremap <Leader>z :e /Users/z/.config/nvim/lua/bozilla/settings.lua<cr>
nnoremap <leader>c :ChecklistToggleCheckbox<cr>
nnoremap <leader>n :NERDTree<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>md :InstantMarkdownPreview<CR>


call plug#begin('~/.config/nvim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'vim-test/vim-test'
Plug 'kvrohit/substrata.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
"Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'mbbill/undotree'
Plug 'psliwka/vim-smoothie'
Plug 'evansalter/vim-checklist'
Plug 'vimwiki/vimwiki'
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
Plug 'neovim/nvim-lspconfig'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
call plug#end()

"set background=dark
colorscheme gruvbox
"colorscheme tokyonight
"colorscheme substrata
highlight Normal ctermbg=none
highlight NonText ctermbg=none
"let g:NERDTreeDirArrowExpandable = '▸'
"let g:NERDTreeDirArrowCollapsible = '▾'

let g:airline#extensions#tabline#enabled = 1
" Start NERDTree and put the cursor back in the other window.
"autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window left.
"autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
"Instant markdown
let g:instant_markdown_autostart = 0
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l
nnoremap <leader>h <C-W>h

" In a test file runs the test nearest to the cursor, otherwise runs the last nearest test.
" In test frameworks that don't support line numbers it will polyfill this functionality with regexes.
"nmap <silent> <leader>t :TestNearest<CR>
" In a test file runs all tests in the current file, otherwise runs the last file tests.
"nmap <silent> <leader>T :TestFile<CR>
"Runs the whole test suite (if the current file is a test file, runs that framework's test suite, otherwise determines the test framework from the last run test).
"nmap <silent> <leader>a :TestSuite<CR>
" Runs the last test.
"nmap <silent> <leader>T :TestLast<CR>
" Visits the test file from which you last run your tests
" (useful when you're trying to make a test pass,
" and you dive deep into application code
" and close your test buffer to make more space,
" and once you've made it pass you want to go back to the test file to write more tests).
"nmap <silent> <leader>g :TestVisit<CR>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup BOZILLA
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

" Reload vimrc after save
if !exists('*ReloadVimrc')
    fun! ReloadVimrc()
        let save_cursor = getcurpos()
        source $MYVIMRC
        call setpos('.', save_cursor)
    endfun
endif
autocmd! BufWritePost $MYVIMRC call ReloadVimrc()

let g:lightline = {'colorscheme': 'seoul256'}
