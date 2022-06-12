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
set cmdheight=1

lua require("bozilla.settings")
inoremap kj <ESC>
inoremap KJ <ESC>
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l
nnoremap <leader>h :NERDTreeFocus<cr>
map <leader>fx :Neoformat ! xml<cr>


"let mapleader = " "
nnoremap <Leader>v :e $MYVIMRC<cr>

nnoremap <leader>c :ChecklistToggleCheckbox<cr>

nnoremap <leader>md :InstantMarkdownPreview<CR>
nnoremap <leader>mds :InstantMarkdownStop<CR>
let g:instant_markdown_autostart = 0

nnoremap <leader>t :NERDTreeToggle<CR>
let g:NERDTreeWinSize=40
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b.NERDTree.isTabTree()) | q | endif


call plug#begin('~/.config/nvim/plugged')
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'olimorris/onedarkpro.nvim'
Plug 'fenetikm/falcon'
Plug 'folke/tokyonight.nvim'
Plug 'tiagovla/tokyodark.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'itchyny/lightline.vim'
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
Plug 'luisiacc/gruvbox-baby', {'branch': 'main'}
call plug#end()
let g:tokyodark_transparent_background = 0
let g:tokyodark_enable_italic_comment = 1
let g:tokyodark_enable_italic = 0
let g:tokyodark_color_gamma = "1.0"

"colorscheme gruvbox-baby
"colorscheme onedarkpro
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

let s:enabled =1
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

"let g:lightline = {}
"let g:lightline = {'colorscheme': 'darcula'}

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
