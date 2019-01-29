let g:mapleader = "\<Space>"

call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
"Plug 'dbeniamine/cheat.sh-vim'

Plug 'pangloss/vim-javascript'
Plug 'rust-lang/rust.vim'
Plug 'StanAngeloff/php.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'Raimondi/delimitMate'
Plug 'srcery-colors/srcery-vim'
Plug 'posva/vim-vue'
Plug 'leafgarland/typescript-vim'

" For autocompletion
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-cssomni'
Plug 'ncm2/ncm2-tern'
Plug 'ncm2/ncm2-racer'
Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}
Plug 'phpactor/ncm2-phpactor'
Plug 'ncm2/ncm2-html-subscope'
Plug 'ncm2/ncm2-markdown-subscope'
call plug#end()

" ======== Theme
set t_Co=256
colorscheme srcery
let g:airline_theme='srcery'

" ======== generic configs
syntax on
filetype plugin indent on
set cursorline
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
set wildignore+=*/.git/*,*/tmp/*,*.swp
set iskeyword+=-                    " Add "-" to the w text object
set timeoutlen=600                  " Leader timeout
set updatetime=100                  " Update speed for git-gutter
set noswapfile

set splitbelow                      " New h-split goes below
set splitright                      " New v-split goes to the right

set foldmethod=indent               " Fold levels based on indent level
set foldlevel=10                    " Fold level when opening files

set wildmenu
set wildmode=list:longest

set list                            " Enable invisible character
set listchars=tab:▸\ ,eol:¬         " Specifiy characters for invisibles

:set inccommand=split

set diffopt+=vertical               " Vertical split diffs

let g:netrw_dirhistmax = 0          " disable netrwhist log file

au BufRead,BufNewFile *.htm set filetype=php " Force php type for htm (October templates)

let ind = indent(prevnonblank(v:lnum - 1)) " Autoindent new lines even after empty lines

hi DiffAdd ctermbg=22
"hi DiffChange guibg=#BBBB33
hi DiffText ctermbg=26
hi NonText ctermfg=236
hi iCursor ctermfg=15
hi Normal ctermbg=NONE
" ======== Disable arrow keys
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

" ======== Visual line navigation
nnoremap k gk
nnoremap j gj
"nnoremap $ g$
nnoremap gk k
nnoremap gj j
"nnoremap g$ j

" ======== Folds shorcuts
nnoremap <F1> zM
nnoremap <F2> zMzr
nnoremap <F3> zMzrzr
nnoremap <F4> zR

" ======== Save
nmap <c-s> :w<cr>
imap <c-s> <esc>:w<cr>

" ======== Genral vim aliases
inoremap jj <ESC>

" ======== Pane navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" ======== Fuzzy find
nnoremap <C-p> :Files<cr>
nnoremap <C-g> :Rg<cr>
nnoremap <C-f> :BLines<cr>

" ======== Auto line number type toggle
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" ======== Hide line background for non-focused splits
augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

" ======== go-vim plugin config
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1

" ======== NERDTree plugin
let NERDTreeShowHidden=1
nmap <F5> :NERDTreeToggle<CR>

" ======== Javascript plugin
let g:javascript_plugin_jsdoc = 1

" ======== Rust plugin
let g:rustfmt_autosave = 1

" ======== Yank highlight plugin
let g:highlightedyank_highlight_duration = 1000

" ======== DelemitMate plugin
let g:delimitMate_matchpairs = ""
let g:delimitMate_jump_expansion = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_inside_quotes = 1

" ======== Ncm2 Autocompletion plugin
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" ======== Easy Align plugin
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" ======== Cheat.sh
let g:CheatSheetDoNotMap=1

" ======== PHP CS Fixer
autocmd BufWritePost *.php silent execute "!php-cs-fixer fix --using-cache=no --no-interaction %"



" ======== Leader commands

" Select previously pasted text
nmap <leader>v `[V`]
" Open vimrc
nmap <leader>nvim <C-w><C-v><C-l>:e $MYVIMRC<cr>
" Quit file
nnoremap <leader>q :q<cr>
" Fuzzy search word under cursor in file names
nmap <leader>p :FZF -q <C-R><C-w><cr>
" Fuzzy search word under cursor in file contents
nmap <Leader>g :Rg <C-R><C-w><cr>
" Fuzzy search word under cursor in file contents
nmap <Leader>b :Buffers<cr>
" Fuzzy search word under cursor in buffer content
nmap <Leader>f :BLines <C-R><C-w><cr>
" Prev/Next diff shortcuts
nmap <Leader>z ]c <cr>
nmap <Leader>x [c <cr>
" Add ; at the end of the line
nmap <Leader>; mcA;<esc>`c
nmap <Leader>, mcA,<esc>`c
"imap <Leader>; <esc>mcA;<esc>`ca
vmap <Leader>; :'<,'>norm A;<esc>
vmap <Leader>, :'<,'>norm A,<esc>
" Cheat.sh | @see cheat.vim
nnoremap <script> <silent> <leader>? :call cheat#cheat("", getcurpos()[1], getcurpos()[1], 0, 0, '!')<CR>
vnoremap <script> <silent> <leader>? :call cheat#cheat("", -1, -1, 2, 0, '!')<CR>
nnoremap <script> <silent> <leader>?n :call cheat#navigate(1, 'A')<CR>
nnoremap <script> <silent> <leader>?p :call cheat#navigate(-1,'A')<CR>
" PHP CS Fixer
nmap <Leader>F :!php-cs-fixer fix --using-cache=no % <cr>
