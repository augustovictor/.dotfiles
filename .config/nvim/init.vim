set encoding=utf-8
set number relativenumber
set noswapfile
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

call plug#begin('~/.vim/plugged')

" Theme
Plug 'morhetz/gruvbox'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'doums/darcula'
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

" Code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Git management
Plug 'tpope/vim-fugitive'

" Debugger
Plug 'puremourning/vimspector' 

" Git blame
Plug 'APZelos/blamer.nvim'

" Python environment
Plug 'jmcantrell/vim-virtualenv'

" Indentation mark
Plug 'Yggdroot/indentLine'
call plug#end()

" General
let mapleader = " "
imap kj <Esc>
tnoremap kj <C-\><C-n>
nnoremap <leader>qq :q<CR>
nnoremap <leader>w :w<CR>

" Automatically enter insert mode when opening terminal
augroup terminal
  au TermOpen * startinsert
augroup end 
" Automatically enable gitblame
let g:blamer_enabled = 1
let g:blamer_delay = 0
let g:blamer_show_in_insert_modes = 0



"Split management
nnoremap <leader>sj :belowright split<CR>
nnoremap <leader>sl :vsplit<CR><C-w>l

" Open terminal
nnoremap <leader><F12> :belowright split<CR>:resize 15<CR>:term<CR>

" Split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
" After selecting line, paste without yanking
vnoremap <leader>p "_dP
" Copy selection to clipboard and re-select
vnoremap <leader>y "+ygv
" Copy whole file and get back to previous position
nnoremap <leader>Y gg"+yG
nnoremap <leader><Tab> :b#<CR>
" Move selection
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" colorscheme darcula
" colorscheme dracula
" colorscheme gruvbox
colorscheme onehalfdark
let g:airline_theme='onehalfdark'
set background=dark
set termguicolors


" NERDTree
nnoremap <leader>a :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
let NERDTreeShowHidden=1


" FuzzyFinderS
nnoremap <C-p> :GFiles<CR>
" Project files
nnoremap <leader>pf :Files<CR>
" Quickfix list
nnoremap <leader>ch :cprev<CR>
nnoremap <leader>cl :cnext<CR>

" Vim fugitive
nmap <leader>gh :diffget \\3<CR>
nmap <leader>gu :diffget \\2<CR>
nmap <leader>gs :G<CR>


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

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
 
" Tab navigation
nnoremap <S-T>t :tabnew<CR>
nnoremap <S-T>h :tabprev<CR>
nnoremap <S-T>l :tabnext<CR>
nnoremap <S-T>x :tabclose<CR>

" Telescope remapings
" Find files using Telescope command-line sugar.
nnoremap <C-p> <cmd>Telescope find_files<CR>
nnoremap <leader>fzf <cmd>Telescope live_grep<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<CR>
nnoremap <leader>gd <cmd>Telescope git_status<CR>

" Telescope extension remapings
" GoTo code navigation.
" nmap <silent> gD zz<leader>sl<Plug>(coc-definition)zz
nmap <silent> gd <Plug>(coc-definition)zt
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
nmap <silent> gr :Telescope coc references<CR>


" Vim commentary
nnoremap <leader>/ :Commentary<CR>
vnoremap <leader>/ :Commentary<CR>

" VirtualEnvs
let g:virtualenv_directory = '/Users/victor.costa/Library/Caches/pypoetry/virtualenvs'
let g:virtualenv_auto_activate = 1
" let g:virtualenv_stl_format = '[%n]'

" Indentation mark
let g:indentLine_enabled = 1
let g:indentLine_char_list = ['|', '¦', '┆', '┊']


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
