
call plug#begin('~/.local/share/nvim/plugged')

Plug 'preservim/nerdtree'

" copy selected folder/file in nerdtree to clipboard by keys <m><b>
Plug 'mortonfox/nerdtree-clip'

" airline, eye candy
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'jdkanani/vim-material-theme'
"Plug 'crusoexia/vim-monokai'
Plug 'morhetz/gruvbox'

" language server protocol: https://github.com/mattn/vim-lsp-settings
"Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'
"Plug 'mattn/vim-lsp-settings'

" syntax highlighting
Plug 'sheerun/vim-polyglot'

" python format
Plug 'Vimjas/vim-python-pep8-indent'

" fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Show indent lines (useful for loops)
Plug 'yggdroot/indentline' 

" Python folding
" Plug 'tmhedberg/SimpylFold' 

" Code formater
Plug 'sbdchd/neoformat'
Plug 'ludovicchabant/vim-gutentags'

Plug 'majutsushi/tagbar'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

set relativenumber

set number

set termguicolors

" also needed for polyglot
syntax on

" set map leader key
let mapleader=" "

" debugging key mappings
" adds a breakpoint after the current line
map <silent> <leader>d oimport pdb; pdb.set_trace()<esc>

" previous next buffer
nnoremap <silent> <leader>b   :bprevious<cr>
nnoremap <silent> <leader>n   :bnext<cr>
" goto previous buffer and delete next buffer:othwerwise buffer deleted and nerdtree ould be full view
nnoremap <silent> <leader>c   :bp\|bd #<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings for Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" map key for NerdTreeToggle
nnoremap <Leader>t :NERDTreeToggle<Enter>
" open nerd tree from start
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" larger width for the Nerdtree
:let g:NERDTreeWinSize=55

" find current buffer in berdtree
map <silent> <leader>v :NERDTreeFind<cr>

"Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile


" airline color scheme
" let g:airline_solarized_bg='dark'
" let g:airline_theme='deus'
let g:airline_theme='gruvbox'

set background=dark
" colorscheme material-theme
" colorscheme monokai
colorscheme gruvbox

" Show tabs
let g:airline#extensions#tabline#enabled = 1

" fuzzy finder
" find file under current directory
nnoremap <silent> <leader>f :FZF<cr>
" find file under HOME directory
nnoremap <silent> <leader>F :FZF ~<cr>
"map :Ag (search pattern in files) at word under cursor to <leaedr>-ag
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>

" Tagbar: Tagbar Toggle
nmap <F8> :TagbarToggle<CR>

" gutentags
" Where to store tag files
let g:gutentags_cache_dir = '~/.nvim/gutentags'
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['.git']

" defines, when new tags are created: 
" https://www.reddit.com/r/vim/comments/d77t6j/guide_how_to_setup_ctags_with_gutentags_properly/
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0

" COV.nvim
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

