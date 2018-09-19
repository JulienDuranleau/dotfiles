runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

let g:material_theme_style = 'dark'
let g:airline_theme = 'material'
set background=dark
colorscheme material
if (has("termguicolors"))
    set termguicolors
endif

set number relativenumber
set numberwidth=4
set tabstop=4
set shiftwidth=4
set expandtab
filetype plugin indent on
syntax on
set wrap! "No wrapping
" set mouse=a
set clipboard=unnamedplus
set splitbelow
set splitright

set wildmenu
set wildmode=list:longest

" disable netrwhist log file
let g:netrw_dirhistmax = 0

" Fuzzy finder
let g:ctrlp_show_hidden = 1

" Javascript
let g:javascript_plugin_jsdoc = 1

let NERDTreeShowHidden=1

" Disable arrow keys
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

" Auto line number toggle
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" go-vim plugin config
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
