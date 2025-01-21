"Search
set incsearch
set hlsearch
set ignorecase
set smartcase
set wrapscan
set number

"Input
set cindent
set expandtab
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]
set clipboard=unnamedplus
set noswapfile
set nobackup
set noundofile
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set ff=unix
set cmdheight=2
set encoding=utf-8

"vim-plugin
":PlugInstall
"call plug#begin()
"Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
"Plug 'vim/vimdoc-ja'
"call plug#end()
"
"
"vim-plug(nvim)
"https://github.com/junegunn/vim-plug
"call plug#begin('~/.local/share/nvim/site/autoload/')
"Plug 'ntk148v/vim-horizon'
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'machakann/vim-highlightedyank'
"Plug 'preservim/nerdtree'
"Plug 'tpope/vim-commentary'
"Plug 'sheerun/vim-polyglot'
"Plug 'h-hg/fcitx.nvim'
"call plug#end()

"theme
"https://dotfyle.com/plugins/catppuccin/nvim
"catppuccin catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
"colorscheme catppuccin-mocha

"highlightedyank settings
"let g:highlightedyank_highlight_duration = 200

" Start NERDTree when Vim is started without file arguments.
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
"nnoremap <C-t> :NERDTreeToggle<CR>


"linux fcitx5 mozc normal mode keep in english
if executable('fcitx5')
   autocmd InsertLeave * :call system('fcitx5-remote -c')
   autocmd CmdlineLeave * :call system('fcitx5-remote -c')
endif

"colorscheme evening


" mac vim japanese input settings
"<C-^>でIM制御が行える場合の設定
let IM_CtrlMode = 4
"ctrl+jで日本語入力固定モードをOnOff
inoremap <silent> <C-j> <C-^><C-r>=IMState('FixMode')<CR>
