" vim rc !
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
set nowrap
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

let mapleader = " "
nnoremap <Leader>s :e $USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json<cr>
nnoremap <Leader>v :e $MYVIMRC<cr>
nnoremap <Leader>a :e $USERPROFILE\GitProjects\cmd\aliases.cmd<cr>
nnoremap <leader>c :ChecklistToggleCheckbox<cr>
nnoremap <leader>n :NERDTree<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>md :InstantMarkdownPreview<CR>

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'mbbill/undotree'
Plug 'psliwka/vim-smoothie'
Plug 'evansalter/vim-checklist'
Plug 'vimwiki/vimwiki'
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
call plug#end()

set background=dark
colorscheme gruvbox
highlight Normal ctermbg=none
highlight NonText ctermbg=none
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Start NERDTree and put the cursor back in the other window.
"autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
"Instant markdown
let g:instant_markdown_autostart = 0
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l
nnoremap <leader>h <C-W>h


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

