call plug#begin('~/.config/nvim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree'
Plug 'kaicataldo/material.vim'
Plug 'vim-airline/vim-airline'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'
Plug 'pangloss/vim-javascript'
Plug 'rust-lang/rust.vim'
Plug 'StanAngeloff/php.vim'

" For autocompletion
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-cssomni'
Plug 'ncm2/ncm2-tern'
Plug 'ncm2/ncm2-racer'
Plug 'phpactor/ncm2-phpactor'
Plug 'ncm2/ncm2-html-subscope'
Plug 'ncm2/ncm2-markdown-subscope'
call plug#end()

" -- Theme
let g:material_theme_style = 'dark'
let g:airline_theme = 'material'
set background=dark
colorscheme material
if (has("termguicolors"))
    set termguicolors
endif

" -- generic configs
filetype plugin indent on
syntax on
set number relativenumber           " line numbers relative to current line
set numberwidth=4                   " line number width
set tabstop=4                        
set shiftwidth=4
set expandtab                       " Turn tabs into spaces
set nowrap                          " No wrapping
"set mouse=a                         " Enable mouse
set clipboard=unnamedplus           " Share clipboard with OS
set history=1000
set backspace=indent,eol,start
set scrolloff=4                     " Number of lines below before scroll

set splitbelow                      " New h-split goes below
set splitright                      " New v-split goes to the right

set foldmethod=indent               " Fold levels based on indent level
set foldlevel=4                     " Fold level when opening files

set wildmenu
set wildmode=list:longest

let g:netrw_dirhistmax = 0          " disable netrwhist log file

" -- Disable arrow keys
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>
vno <down> <Nop>
vno <left> <Nop>
vno <right> <Nop>
vno <up> <Nop>

" -- Folds shorcuts
nnoremap <F1> zM
nnoremap <F2> zMzr
nnoremap <F3> zMzrzr
nnoremap <F4> zR

" -- Auto line number type toggle
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" -- go-vim plugin config
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1

" -- NERDTree plugin
let NERDTreeShowHidden=1
nmap <F5> :NERDTreeToggle<CR>

" -- CtrlP Fuzzy finder plugin
let g:ctrlp_show_hidden = 1

" -- Javascript plugin
let g:javascript_plugin_jsdoc = 1

" -- Rust plugin
let g:rustfmt_autosave = 1

" -- Ncm2 Autocompletion plugin
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
