execute pathogen#infect()
syntax on
filetype plugin indent on

set tabstop=3
set shiftwidth=3
"set expandtab


map <C-n> :NERDTreeToggle<CR>
" close nerdtree if it's the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ctrl-P
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|.svn|target)$',
  \ 'file': '\v\.(exe|so|dll|class)$',
  \ }

set nu

