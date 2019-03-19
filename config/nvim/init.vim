let g:mapleader = "\<Space>"

call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'KabbAmine/zeavim.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'rafaqz/ranger.vim'

Plug 'pangloss/vim-javascript'
Plug 'rust-lang/rust.vim'
Plug 'StanAngeloff/php.vim'
Plug 'Raimondi/delimitMate'
Plug 'srcery-colors/srcery-vim'
Plug 'posva/vim-vue'
Plug 'leafgarland/typescript-vim'
Plug 'elzr/vim-json'
Plug 'heavenshell/vim-jsdoc'

" Easy-motion? https://github.com/justinmk/vim-sneak 

" For autocompletion
Plug 'ajh17/VimCompletesMe'
" @see https://github.com/Shougo/deoplete.nvim
" @see https://github.com/neoclide/coc.nvim
call plug#end()

" ======== Theme
set t_Co=256
colorscheme srcery
let g:airline_theme='srcery'
hi Comment ctermfg=238

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
set synmaxcol=200                   " Set max highlight column. Avoid loooong lines
set undodir=~/.vim/undodir          " Set undo savefile location
set undofile                        " Enable undo savefile to undo after exit

set splitbelow                      " New h-split goes below
set splitright                      " New v-split goes to the right

set foldmethod=indent               " Fold levels based on indent level
set foldlevel=10                    " Fold level when opening files

set wildmenu
set wildmode=list:longest

set list                            " Enable invisible character
set listchars=tab:▸\ ,eol:¬         " Specifiy characters for invisibles

set inccommand=split

set diffopt+=vertical               " Vertical split diffs

"let g:netrw_dirhistmax = 0          " disable netrwhist log file
"let g:netrw_banner = 0
"let g:netrw_browse_split = 5
"let g:netrw_liststyle = 3
"let g:netrw_winsize = 25
"let g:netrw_localrmdir="rm -r"

au BufRead,BufNewFile *.htm set filetype=php " Force php type for htm (October templates)
au BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css " Force multipe types for vue files

autocmd FileType vue syntax sync fromstart " Fix broken highligh for multilang vue files
autocmd VimResized * wincmd =        " Auto ajust splits on vim resize (eg: tmux resize or zoom)

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
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-h> <C-w>h
" nnoremap <C-l> <C-w>l

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

" ======= Change register
" - Ex: qa  Create macro 'a'
" - cra     Edit macro 'a'
function! ChangeReg() abort
    let r = nr2char(getchar())
    if r =~# '[a-zA-Z0-9"@\-:.%#=*"~_/]'
        call feedkeys("q:ilet @" . r . " = \<C-r>\<C-r>=string(@" . r . ")\<CR>\<ESC>", 'n')
    endif
endfunction
nnoremap <silent> <leader>cr :call ChangeReg()<CR>


" ======= Netrw
" augroup netrw_mapping
"     autocmd!
"     autocmd filetype netrw call NetrwMapping()
" augroup END

" function! NetrwMapping()
"     nmap <buffer> e <cr>
" endfunction

" ======== go-vim plugin config
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1


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

" ======== Easy Align plugin
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" ======== PHP CS Fixer
autocmd BufWritePost *.php silent execute "!php-cs-fixer fix --using-cache=no --no-interaction %"

" ======== JSON
let g:vim_json_syntax_conceal = 0

" ======== Zeal
let g:zv_disable_mapping = 1
let g:zv_zeal_args = '--stylesheet=$HOME/dotfiles/config/zeal/theme.qss'

" ======== Git Gutter
let g:gitgutter_map_keys = 0
hi GitGutterAdd ctermfg=255 ctermbg=22
hi GitGutterChange ctermfg=255 ctermbg=130
hi GitGutterDelete ctermfg=255 ctermbg=52
hi GitGutterChangeDelete ctermfg=255 ctermbg=130

" ======== Vim Tmux Navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr><Paste>

" ======= Ranger
nmap <leader>rr :RangerEdit<cr>
nmap <leader>rv :RangerVSplit<cr>
nmap <leader>rs :RangerSplit<cr>
nmap <leader>rt :RangerTab<cr>
nmap <leader>ri :RangerInsert<cr>
nmap <leader>ra :RangerAppend<cr>
nmap <leader>rc :set operatorfunc=RangerChangeOperator<cr>g@
nmap <leader>rd :RangerCD<cr>
nmap <leader>rld :RangerLCD<cr>

" ======= Commentary
autocmd FileType php setlocal commentstring=\/\/\ %s

" ======== Leader commands

" Swap/move lines vertically
vnoremap <C-k> :m-2<CR>gv
vnoremap <C-j> :m '>+<CR>gv
" Select previously pasted text
nmap <leader>v `[V`]
" Open vimrc
nmap <leader>nvim :vsp $MYVIMRC<cr>
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
vmap <Leader>; :'<,'>norm A;<esc>,
" Add , at the end of the line
nmap <Leader>, mcA,<esc>`c
vmap <Leader>, :'<,'>norm A,<esc>,
" Current file name without extension
imap <Leader>fn <c-r>=expand("%:t:r")<cr>
" JSDoc - Add jsdoc to function
nmap <silent> <Leader>l <Plug>(jsdoc)
" Zeal - search docs
nmap sd <Plug>ZVOperator
nmap <leader>sd <Plug>ZVKeyDocset
" Tmux run last command    -- C-c = cancel current cmd, C-p = retype last cmd, C-o = execute line
nmap <leader>tr :silent exec "!tmux send-keys -t right C-c && tmux send-keys -t right C-p C-o"<cr>
" Tmux send visual selection to other pane
vmap <leader>ts "zy :silent exec '!tmux send -t right "' . substitute(escape(@z, '\"$'), '\n', '" Enter "', "g") . '" Enter'<cr>
" Netrw
" nmap <F5> :Lex<cr>
" nmap <leader>e :Ex!<cr>
