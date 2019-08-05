let g:powerline_pycmd="py3"
set laststatus=2 " Always display the statusline in all windows
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)


call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
 Plug 'junegunn/seoul256.vim'
 Plug 'junegunn/vim-easy-align'

" Group dependencies, vim-snippets depends on ultisnips
 Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
 Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
 Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using git URL
 Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Plugin options
 Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
 Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

" Unmanaged plugin (manually installed and updated)
 Plug '~/my-prototype-plugin'

" Using plug for wal compatibility (colour theme switching)
Plug 'dylanaraps/wal.vim'

" Using youcompleteme (autocompletion)
Plug 'Valloric/YouCompleteMe'

colorscheme wal

call plug#end()


