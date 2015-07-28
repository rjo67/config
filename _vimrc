"lang en
language mes en
set langmenu=en_US.UTF-8

syntax on
filetype indent on
filetype plugin indent on
set ai

set tabstop=3
set shiftwidth=3
"set expandtab

" diff
set diffopt=vertical

set cursorline

set laststatus=2
set statusline=%<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P

set incsearch
set hlsearch
set nowrapscan

set number
set noerrorbells visualbell

map <C-n> :NERDTreeToggle<CR>
" close nerdtree if it's the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ctrl-P
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|.svn|target)$',
  \ 'file': '\v\.(exe|so|dll|class)$',
  \ }

execute pathogen#infect()

if has("gui_running")
   set lines=50
   set columns=125
   colorscheme darkblue_mod
   if &diff
      autocmd VimResized * wincmd =
      autocmd GuiEnter * simalt ~x
      set wrap
   endif 
else
  " console vim
  colorscheme darkblue_mod
  " avoid red background for current line
  hi CursorLine term=bold cterm=bold guibg=Grey40
endif

