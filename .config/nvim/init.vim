set encoding=utf-8
set number relativenumber
set noswapfile
set mouse+=a
set scrolloff=9
set backspace=indent,eol,start
set smartcase
set ignorecase
set nohlsearch
set hidden
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set noswapfile
set nowrap
" set signcolumn=yes
"set colorcolumn=80
set cursorline
" set cursorcolumn
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set fileformat=unix
"set clipboard=unnamed
set splitbelow

call plug#begin('~/.vim/plugged')

" Theme
Plug 'morhetz/gruvbox'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
" Plug 'doums/darcula'
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Navigation
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'kshenoy/vim-signature'

" Fuzzy finder
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
Plug 'szw/vim-maximizer'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Coc extension for telescope
Plug 'fannheyward/telescope-coc.nvim'

"Comment code
Plug 'tpope/vim-commentary'

" Surround code
Plug 'tpope/vim-surround'

" Multi visual selection and edition
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Autopairs
Plug 'jiangmiao/auto-pairs'

" Code linting and navigation
Plug 'dense-analysis/ale'

" Code highlight
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/playground'
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

" Code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Git management
Plug 'tpope/vim-fugitive'

" Debugger
Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-python --enable-python'}

" Git blame
Plug 'APZelos/blamer.nvim'

" Python environment
Plug 'jmcantrell/vim-virtualenv'

" Indentation mark
Plug 'Yggdroot/indentLine'

" Vim session
Plug 'tpope/vim-obsession'

" Rainbow brackets
Plug 'p00f/nvim-ts-rainbow'

" Code formatter
Plug 'Chiel92/vim-autoformat'

" Floating terminal
Plug 'voldikss/vim-floaterm'

" Colorize hexa colors
Plug 'lilydjwg/colorizer'

" Pytest
Plug 'alfredodeza/pytest.vim'

" Linediff
Plug 'AndrewRadev/linediff.vim'

call plug#end()

" General
let mapleader = " "
imap kj <Esc>
tnoremap kj <C-\><C-n>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :wa<CR>
nnoremap <S-R> :e<CR>
" nnoremap <leader>wa :wa<CR>

" Automatically enter insert mode when opening terminal
augroup terminal
  au TermOpen * startinsert
augroup end 

" Save session on new buffers
au BufNew,BufDelete * :mksession!<CR>

" Automatically enable gitblame
let g:blamer_enabled = 1
let g:blamer_delay = 0
let g:blamer_show_in_insert_modes = 0

" Obsession (Vim session recording)
augroup start_obsession
    autocmd!
    autocmd VimEnter * Obsession
augroup END
set statusline+=%{ObsessionStatus()}
" Split management
" nnoremap ;j mz:new<CR>:b#<CR>`z:delm z<CR>
nnoremap <leader>sj :belowright split<CR>
nnoremap <leader>sk :split<CR><C-w>k
nnoremap <leader>sl :vsplit<CR><C-w>l
nnoremap <leader>sh :vsplit<CR>
" Split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Resize splits
" nnoremap <M-S-k> :res-5<CR>
" nnoremap <M-S-j> :res+5<CR>
" nnoremap <M-S-l> :res+5<CR>
" nnoremap <M-S-h> :res-5<CR>

" Open terminal
nnoremap <leader><F12> :belowright split<CR>:resize 15<CR>:term<CR>

" Source nvim config file
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
" After selecting line, paste without yanking
vnoremap <leader>p "_dP
" Copy selection to clipboard and re-select
vnoremap <leader>y "+ygv
" Copy whole file and get back to previous position
nnoremap Y y$
" Keep cursor centered when navigating occurrences
nnoremap n nzzzv
nnoremap N Nzzzv
" Keep cursor at same place when joining lines
nnoremap J mzJ`zmz " Add specific keys to undolist when in insertmode
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap ( (<c-g>u
inoremap { {<c-g>u
inoremap [ [<c-g>u
inoremap = =<c-g>u
inoremap " "<c-g>u
nnoremap <leader>Y gg"+yG
nnoremap <leader><Tab> :b#<CR>
" Move selection
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" Add to jumplist when moves > 5
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

colorscheme darcula
set background=dark
" colorscheme nord
let g:airline_theme='molokai'
set background=dark
set termguicolors


" NERDTree
nnoremap <nowait> <leader>a :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-a> :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
let NERDTreeShowHidden=1
let NERDTreeMapOpenSplit='<C-j>'
let NERDTreeMapOpenSplit='<C-j>'
let NERDTreeMapOpenVSplit='<C-h>'

" FuzzyFinderS
" nnoremap <C-p> :GFiles<CR>
" Project files
nnoremap <leader>pf :Files<CR>
" Quickfix list
nnoremap <leader>ch :cprev<CR>
nnoremap <leader>cl :cnext<CR>

" Vim fugitive
nnoremap <leader>gs :G<CR>
nnoremap <leader>ga :Git add %<CR>
" nnoremap <leader>gdi :Git diff<CR> " Better done with telescope
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>zzz :Git stash<CR>
nnoremap <leader>zza :Git stash pop<CR>
nmap <leader>gl :diffget //3<CR>
nmap <leader>gh :diffget //2<CR>


" COC mappings
" use <tab> for trigger completion and navigate to the next complete item
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <C-p> <C-\><C-O>:call CocActionAsync('showSignatureHelp')<CR>
nmap <F6> <Plug>(coc-rename)

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <leader>ca  <Plug>(coc-codeaction)
nmap <leader>cf  <Plug>(coc-fix-current)

" Code formatting
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

" Tab management and navigation
nnoremap <S-T>T :tabnew<CR>
nnoremap <S-T>q :tabclose<CR>
nnoremap <S-H> :tabprev<CR>
nnoremap <nowait> <S-L> :tabnext<CR>
noremap <A-S-Left>  :-tabmove<cr>
noremap <A-S-Right> :+tabmove<cr>

" Telescope remapings
" Find files using Telescope command-line sugar.
nnoremap <C-p> <cmd>Telescope find_files<CR>
nnoremap <leader>fzf <cmd>Telescope live_grep<CR>
nnoremap <leader>fz. <cmd>Telescope current_buffer_fuzzy_find<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<CR>
nnoremap <leader>kb <cmd>Telescope keymaps<CR>
nnoremap <C-e> <cmd>Telescope oldfiles<CR>
" nnoremap <leader>gd <cmd>Telescope git_status<CR>

" Telescope extension remapings
" GoTo code navigation.
" nmap <silent> gD zz<leader>sl<Plug>(coc-definition)zz
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
nmap <silent> gr :Telescope coc references<CR>

" Code highlighting
augroup HighlightUnderCursor
  autocmd! CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
augroup END

" VirtualEnvs
let g:virtualenv_directory = '/Users/victor.costa/Library/Caches/pypoetry/virtualenvs'
let g:virtualenv_auto_activate = 1
" let g:virtualenv_stl_format = '[%n]'

" Indentation mark
let g:indentLine_enabled = 1
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" Maximizer
nnoremap <C-m> :MaximizerToggle!<CR>
 
"" Vimspector
nmap <leader>dd :call vimspector#Launch()<CR> 
nmap <leader>d_ :call vimspector#Restart()<CR> 
nmap <leader><F8> :call vimspector#ToggleBreakpoint()<CR>
nnoremap <F9> :call vimspector#Continue()<CR>
nnoremap <leader>dc :call vimspector#RunToCursor()<CR>
nnoremap <leader>dq :call vimspector#Reset()<CR>

" Copy current file path
noremap <silent> <F4> :let @+=expand("%:p")<CR>

" FloatTerm
tnoremap kjq <C-\><C-n> :FloatermToggle<CR>
nnoremap <silent> <leader>t :FloatermToggle<CR>

" open last closed buffer
function! OpenLastClosed()
    let last_buf = bufname('#')

    if empty(last_buf)
        echo "No recently closed buffer found"
        return
    endif
    let result = input("Open ". last_buf . " in (n)ormal (v)split, (t)ab or (s)plit ? (n/v/t/s) : ")
    if empty(result) || (result !=# 'v' && result !=# 't' && result !=# 's' && result !=# 'n')
        return
    endif
    if result ==# 't'
        execute 'tabnew'
    elseif result ==# 'v'
        execute "vsplit"
    elseif result ==# 's'
        execute "split"
    endif
    execute 'b ' . last_buf
endfunction

nnoremap <C-t> :call OpenLastClosed() <CR>

" Pytest
nmap <silent><leader>pt <Esc>:Pytest file<CR>
nmap <silent><leader>ps <Esc>:Pytest session<CR><C-w>p
nmap <silent><leader>c <Esc>:Pytest class<CR>
nmap <silent><leader>m <Esc>:Pytest method<CR>
nmap <silent><leader>m <Esc>:Pytest method<CR>

" Linediff
augroup DisableMappings
  autocmd! VimEnter * :nunmap <leader>tc
augroup END
vnoremap <leader>da :LinediffAdd<CR>
nnoremap <leader>df :LinediffShow<CR>:windo set wrap<CR>
nnoremap <leader>dq :LinediffReset<CR>
" inoremap <C-p> <C-\><C-O>:call CocActionAsync('showSignatureHelp')<CR>

" Search dotfiles
" Not working yet
" nnoremap <leader>vrc :lua require('telescope').search_dot_files()<CR>
" -----------------------------------------------------------------------------------
" After a quick list result, press enter and navigate quick list items with
" above remaps.
" :copen to view quicklist
" Apply action to all items with cdo and save with :wa
" Selection
" In visual line mode press ':' to get the selected range

" Editing macros
" :reg to see registered macros
" paste register with macro: "ap
" Edit the content and yank to a register with V"ay

" To jump to next open curly braces: ]m
" New tab: 
" Check characters sent to terminal with: sed -n l
"
"
"
" Overwrite lua plugin mapings
" 1. Find the extension and function to overwrite
" 2. Write the remap
" 
