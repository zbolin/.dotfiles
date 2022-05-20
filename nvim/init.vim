"lua <<EOF
"print('hello from lua')
"EOF
" vim rc !
set nocompatible
filetype off
set clipboard^=unnamed,unnamedplus
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set exrc
set nu
"set relativenumber
set nohlsearch
set hidden
set noerrorbells
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=26
set cmdheight=2
set encoding=UTF-8
set noshowmatch

inoremap kj <ESC>
inoremap KJ <ESC>
map <leader>j <C-W>j
map <leader>k <C-W>k
map <leader>l <C-W>l
map <leader>h <C-W>h
map <leader>fx :Neoformat ! xml<cr>

lua require("bozilla.settings")

let mapleader = " "
nnoremap <Leader>v :e $MYVIMRC<cr>

nnoremap <leader>c :ChecklistToggleCheckbox<cr>

nnoremap <leader>md :InstantMarkdownPreview<CR>
nnoremap <leader>mds :InstantMarkdownStop<CR>
let g:instant_markdown_autostart = 0

nnoremap <leader>t :NERDTreeToggle<CR>
let g:NERDTreeWinSize=40
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b.NERDTree.isTabTree()) | q | endif


call plug#begin('~/.config/nvim/plugged')

Plug 'tiagovla/tokyodark.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'vim-test/vim-test'
Plug 'pprovost/vim-ps1'
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'evansalter/vim-checklist'
Plug 'psliwka/vim-smoothie'
Plug 'mbbill/undotree'
Plug 'vimwiki/vimwiki'
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
Plug 'neovim/nvim-lspconfig'
Plug 'sbdchd/neoformat'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
call plug#end()
let g:tokyodark_transparent_background = 0
let g:tokyodark_enable_italic_comment = 1
let g:tokyodark_enable_italic = 1
let g:tokyodark_color_gamma = "1.0"
colorscheme tokyodark
"colorscheme gruvbox

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup BOZILLA
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
    autocmd VimEnter * call FckThatMatchParen()
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

let s:enabled = 0
if s:enabled
    if (has('nvim'))
        let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
    endif
    if (has('termguicolors'))
        set termguicolors
    endif
endif

function! g:FckThatMatchParen()
    if exists(":NoMatchParen")
        :NoMatchParen
    endif
endfunction

let g:lightline = {}
"let g:lightline = {'colorscheme': 'gruvbox'}



