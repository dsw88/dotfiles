"
" My vimrc file
"

" We want vim, not vi
set nocompatible

set encoding=utf-8

let mapleader = "\<Space>" " Use leader key for space

filetype plugin indent on  " Load plugins according to detected filetype.

" Synax on with monokai color scheme (requires https://github.com/sickill/vim-monokai)
syntax enable
colorscheme monokai

set number                 " Show line numbers
set noswapfile             " Don't use swap files (I save a lot)
set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set softtabstop =4         " Tab key indents by 4 spaces.
set shiftwidth  =4         " >> indents by 4 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.

set backspace   =indent,eol,start  " Make backspace work as you would expect.
set hidden                 " Switch between buffers without having to save first.
set laststatus  =2         " Always show statusline.
set display     =lastline  " Show as much as possible of the last line.

set showmode               " Show current mode in command-line.
set showcmd                " Show already typed keys when more are expected.

set incsearch              " Highlight while searching with / or ?.
set hlsearch               " Keep matches highlighted.

set ttyfast                " Faster redrawing.
set lazyredraw             " Only redraw when necessary.

set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.

set cursorline             " Find the current line quickly.
set wrapscan               " Searches wrap around end-of-file.
set report      =0         " Always report changed lines.
set synmaxcol   =200       " Only highlight the first 200 columns.

" Set up easy keys for split navigations
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" Set up easy keys for buffer navigation
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" Set up key bindings for NERDTree
nnoremap <Leader>t :NERDTreeToggle<CR>

" Configure longer command history
set history=200

" Black on save
autocmd BufWritePre *.py execute ':Black'

" Show non-printable characters.
set list
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

"
" EasyMotion Config
"
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap <Leader>s <Plug>(easymotion-s)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

"
" Neosnippet.vim Config
"
let g:neosnippet#disable_runtime_snippets = {'_' : 1}
let g:neosnippet#snippets_directory = "~/.vim/neosnippets.vim/snippets"

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"
" FZF config
"
nnoremap <Leader>o :<C-u>FZF<CR>
nnoremap <Leader>p :Commands<CR>
nnoremap <Leader>h :Ag<CR>
nnoremap <Leader>r :History<CR>
nnoremap <Leader>b :Buffers<CR>


    - { url: 'https://github.com/preservim/nerdtree/archive/refs/heads/master.zip' }
    - { url: 'https://github.com/tpope/vim-surround/archive/refs/heads/master.zip' }
    - { url: 'https://github.com/vim-airline/vim-airline/archive/refs/heads/master.zip' }
    - { url: 'https://github.com/tpope/vim-fugitive/archive/refs/heads/master.zip' }
    - { url: 'https://github.com/tpope/vim-commentary/archive/refs/heads/master.zip' }
    - { url: 'https://github.com/psf/black/archive/refs/heads/main.zip' }
    - { url: 'https://github.com/airblade/vim-gitgutter/archive/refs/heads/master.zip' }
    - { url: 'https://github.com/hashivim/vim-terraform/archive/refs/heads/master.zip' }
    - { url: 'https://github.com/easymotion/vim-easymotion/archive/refs/heads/master.zip' }
    - { url: 'https://github.com/Shougo/neosnippet.vim/archive/refs/heads/master.zip' }
    - { url: 'https://github.com/junegunn/fzf/archive/refs/heads/master.zip' }
    - { url: 'https://github.com/junegunn/fzf.vim/archive/refs/heads/master.zip' }
    - { url: 'https://github.com/b4winckler/vim-angry/archive/refs/heads/master.zip' }
