
set nocompatible
filetype off
"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'
"NeoBundle 'scrooloose/nerdtree'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'jeffreyiacono/vim-colors-wombat'
NeoBundle 'nathanaelkane/vim-indent-guides'
	" vim-indent-guides
	let g:indent_guides_enable_on_vim_startup=1
	let g:indent_guides_guide_size=1
NeoBundle 'Shougo/unite.vim'
	" 入力モードで開始する
	"let g:unite_enable_start_insert=1
	" バッファ一覧
	nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
	" ファイル一覧
	nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
	" レジスタ一u
	nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
	" 最近使用したファイル一覧
	nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
	" 常用セット
	nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
	" 全部乗せ
	nnoremap <silent> ,uo :<C-u>Unite bookmark<CR>
	let g:unite_source_history_yank_enable = 1
	nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>	
	" ウィンドウを分割して開く
	au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
	au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
	" ウィンドウを縦に分割して開く
	au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
	au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
	" ESCキーを2回押すと終了する
	au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
	au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vimfiler'
	"Settings for vimfiler
	"vimfilerをデフォルトのファイラーとして使う
	let g:vimfiler_as_default_explorer = 1
	"現在開いているバッファのディレクトリを開く
	nnoremap <silent> <Leader>fe :<C-u>VimFilerBufferDir -quit<CR>
	"現在開いているバッファをIDE風に開く
	nnoremap <silent> <Leader>fi :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>
	"Safe Modeは要らんですよ
	let g:vimfiler_safe_mode_by_default = 0

NeoBundle 'thinca/vim-quickrun'


NeoBundle 'davidhalter/jedi-vim'
	"docstringは表示しない
    autocmd FileType python setlocal completeopt-=preview
NeoBundle 'vim-scripts/YankRing.vim'
	let g:yankring_history_dir = '~/'
NeoBundle 'scrooloose/syntastic' "文法確認 よくない
NeoBundle 'mhinz/vim-startify'
	let g:startify_bookmarks = [
	 \ '~/.vimrc',
	 \ '~/.gvimrc',
	 \ '~/.zshrc',
	 \ ]
NeoBundle 'tyru/caw.vim.git'
	nmap <C-K> <Plug>(caw:i:toggle)
	vmap <C-K> <Plug>(caw:i:toggle)

call neobundle#end()

" Required:
filetype plugin indent on

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意。
NeoBundleCheck

"-------------------------
" End Neobundle Settings.
"-------------------------

"-------------------------
"Start Lightline.vim settings
"-------------------------
set laststatus=2
set t_Co=256
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }
"--------------------------
"End Lightline.vim settings
"--------------------------

"--------------------------
"Start Vim settings
"--------------------------
syntax on
set encoding=utf8
set fileencoding=utf-8
"スクロールするときに下が見えるようにする
set scrolloff =5
" .swapファイルを作らない
set noswapfile
" バックアップファイルを作らない
set nowritebackup
" バックアップをしない
set nobackup
" バックスペースで各種消せるようにする
set backspace=indent,eol,start
" ビープ音を消す
set vb t_vb=
set novisualbell
" OSのクリップボードを使う
set clipboard+=unnamed
set clipboard=unnamed
set clipboard+=autoselect
" 不可視文字を表示
set list
" 行番号を表示
set number
" 右下に表示される行・列の番号を表示する
set ruler
" compatibleオプションをオフにする
set nocompatible
" 移動コマンドを使ったとき、行頭に移動しない
set nostartofline
" 対応括弧に<と>のペアを追加
set matchpairs& matchpairs+=<:>
" 対応括弧をハイライト表示する
set showmatch
" 対応括弧の表示秒数を3秒にする
set matchtime=3
" ウィンドウの幅より長い行は折り返され、次の行に続けて表示される
set wrap
" 入力されているテキストの最大幅を無効にする
set textwidth=0
" 不可視文字を表示
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
" インデントをshiftwidthの倍数に丸める
set shiftround
" 補完の際の大文字小文字の区別しない
set infercase
" 小文字の検索でも大文字も見つかるようにする
set ignorecase
" ただし大文字も含めた検索の場合はその通りに検索する
set smartcase
" インクリメンタルサーチを行う
set incsearch
" 検索結果をハイライト表示
set hlsearch
" コマンド、検索パターンを10000個まで履歴に残す
set history=10000
" マウスモード有効
set mouse=a
" コマンドを画面最下部に表示する
set showcmd
" 新しく開く代わりにすでに開いてあるバッファを開く
set switchbuf=useopen
" バッファを閉じる代わりに隠す
set hidden
" 0埋めの文字でCtrl+aする際に10進数も認識させる
set nf=
" 画面に表示されるタブ幅
set tabstop=4
" タブをスペース展開
set expandtab
" インデント時のスペース数
set shiftwidth=4
" タブが押された場合にtabstopでなく、shiftwidthの数だけインデントする
set smarttab
" 自動インデント
set autoindent


" デフォルト不可視文字は美しくないのでUnicodeで綺麗に
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
 

"--------------------------
"End vim settings
"--------------------------

"--------------------------
"KEY BINDINGS
"--------------------------
" 入力モード中に素早くjjと入力した場合はESCとみなす
inoremap jj <Esc>
" ESCを二回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>
" TABにて対応ペアにジャンプ
nnoremap <Tab> %
vnoremap <Tab> %
" 表示行単位で上下移動するように
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk
" 逆に普通の行単位で移動したい時のために逆の map も設定しておく
nnoremap gj j
nnoremap gk k
" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"インサートモードでも移動
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-h> <left>
inoremap <c-l> <right>

"--------------------------
"SETTINGS FOR PYTHON
"--------------------------
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd BufNewFile *.py 0r $HOME/.vim/template/python.txt
"--------------------------
"SETTINGS FOR PYTHON ENDS HERE
"--------------------------
"
:cnoremap ee VimFiler -split -simple -winwidth=35 -no-quit

