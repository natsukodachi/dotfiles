" 行番号を表示
set number
" バックアップファイルを作らない
set nobackup
" カーソルを文字列の一つ先まで
set splitright
set virtualedit=onemore

"---インデント---
" Tab文字を半角スペースにする
set expandtab
" Tabキーの幅
set tabstop=2
" 前の行のインデントを引き継ぐ
set autoindent
" ブロックに応じてインデントを増減させる
set smartindent
" インデントの幅
set shiftwidth=2
" ステータスラインの行
set laststatus=2

"---検索---
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" インクリメンタルサーチ
set incsearch
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>


" set up the dein.vim directory
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let g:rc_dir = expand('~/.vim')

" automatic installation of dein.vim
if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " load the file which contain the plugin list
  let s:toml_dir  = $HOME . '/.config/nvim/dein'
  let s:dein_toml      = s:toml_dir . '/dein.toml'
  let s:dein_lazy_toml = s:toml_dir . '/dein_lazy.toml'
  let s:dark_powered_toml = s:toml_dir . '/dark_powered.toml'

  call dein#load_toml(s:dein_toml, {'lazy': 0})
  call dein#load_toml(s:dein_lazy_toml, {'lazy': 1})
  call dein#load_toml(s:dark_powered_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" automatically install any plug-ins that need to be installed.
if dein#check_install()
  call dein#install()
endif

"---colorscheme---
set t_Co=256
colorscheme PaperColor
syntax on

" なぜかluaのハイライトがおかしい
lua << EOF
  local lspconfig = require('lspconfig')
  lspconfig.clangd.setup({})
  lspconfig.fortls.setup({})
  lspconfig.pyright.setup({})
EOF



