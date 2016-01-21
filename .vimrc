""""""""""""""""""""""""""""""""""""""""""""""""
"		Su's ".vimrc"
"Version:
"	2014/12/02
"
"
"
""""""""""""""""""""""""""""""""""""""""""""""""


set nocompatible


"使Vim在指定备份文件夹和undo文件夹
set backupdir=~/.vim/backupdir
set undodir=~/.Vim/undodir

" 高亮当前行
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

"拼写检查,之检查英文
"set spell
"set spelllang=en

"使用鼠标
"set mouse=a
"""""""""""""""""""""""""
"       显示设置        "
"""""""""""""""""""""""""
"语法高亮,
syntax on
"显示当前的行号列号：
set ruler
"在状态栏显示正在输入的命令
set showcmd
"行号
set number
"关闭/打开配对括号高亮
"NoMatchParen
"DoMatchParen
"设置背景模式，light，dark
set background=dark

"""""""""""""""""""""""""
"       缩进设置        "
"""""""""""""""""""""""""
"依文件类型设置自动缩进
filetype indent plugin on
" 文件中一个 <Tab> 占据的空格数。
set tabstop=4       
 " 每一级自动缩进的空格数。
set shiftwidth=4    
" 使用合适数目的空格插入 <Tab>.
" 当 '自动缩进' 打开时使用 '>' 和 '<' 命令来用空格缩进
" 当 'expandtab' 打开时使用 CTRL-V <Tab> 来插入tab.
set expandtab       
" 当打开时，行首的 <Tab> 会按照 'shiftwidth' 插入空白
" 在其他地方使用 'tabstop'
" 一个 <退格> 会删除行首的一个 'shiftwidth' 大小的空格
set smarttab
" When a bracket is inserted, briefly jump to the matching
" one. The jump is only done if the match can be seen on the
" screen. The time to show the match can be set with
" 'matchtime'.
set showmatch

 " 当开始新行时复制当前行的缩进
 " (typing <CR> in Insert mode or when using the "o" or "O"
 " command).
set autoindent

"""""""""""""""""""""""""
"       搜索设置        "
"""""""""""""""""""""""""
"环绕搜索
set wrapscan
" 当有一个符合之前搜索的值时，高亮所有匹配
set hlsearch
" 当输入搜索命令时，离开显示符合与目前输入的模式匹配的内容
set incsearch
" 在搜索中忽略大小写
set ignorecase      
" 如果搜索中有大写字符，忽略 'ignorecase' 选项
set smartcase       


"""""""""""""""""""""""""
"       映射设置        "
"""""""""""""""""""""""""
"为方便复制，用<F2>开启/关闭行号显示:
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
"Change to the light background,as the dark is the defalut option.
nnoremap <C-,> :set background=light<CR>
nnoremap <C-.> :set background=dark<CR>

nmap <F8> :TagbarToggle<CR>

set pastetoggle=<F7>

"""""""""""""""""""""""""
"      补全设置        "
"""""""""""""""""""""""""
"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set completeopt+=longest

"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
 
"回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

"上下左右键的行为
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"""""""""""""""""""""""""
"     Vundle设置        "
"""""""""""""""""""""""""
"https://github.com/gmarik/Vundle.vim"
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" kEep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

"""""""""""""""""""""""""
"NERD Tree
"""""""""""""""""""""""""
let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
" Automatically open a NERDTree if no files where specifie
autocmd StdinReadPre * let s:std_in=1
autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Open a NERDTree
"nmap <F5> :NERDTreeMirror<CR>
nmap <F5> :NERDTreeToggle<CR>


"""""""""""""""""""""""""
"Tagbar
"""""""""""""""""""""""""
let g:tagbar_width=35
let g:tagbar_autofocus=1
nmap <F6> :TagbarToggle<CR>


"""""""""""""""""""""""""
"ctrap
"""""""""""""""""""""""""
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

set laststatus=2 " Always display the status line
if has('statusline')
    :so /home/gudh/.vim/bundle/vim-fugitive/plugin/fugitive.vim
    set laststatus=2
endif
set statusline+=%{fugitive#statusline()} "  Git Hotness
if executable('ag')
     " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor
    " Use ag in CtrlP for listing files.
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    " Ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

"语法检查
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"""""""""""""""""""""""""
"      设置        "
"""""""""""""""""""""""""

" Influences the working of <BS>, <Del>, CTRL-W
" and CTRL-U in Insert mode. This is a list of items,
" separated by commas. Each item allows a way to backspace
" over something.
set backspace=2

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
            \ if line("'\"") > 1 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

"代码较长时可启用代码折叠功能，如按语法高亮元素折叠：
set foldmethod=syntax
"默认情况下不折叠
set foldlevel=99
"随后即可使用z系列命令管理代码折叠
"如za会翻转当前位置的折叠状态，zA会递归翻转当前层所有代码的折叠状态等。


"AutoComplPop
Plugin 'AutoComplPop'
"scrooloose/syntastic
Plugin 'scrooloose/syntastic'
"taglist"
"Plugin 'vim-taglist'
"Tagbar"
Plugin 'Tagbar'
"c.vim
"Plugin 'c.vim'
"NERDTree
Plugin 'The-NERD-tree'
"Ctrap
Plugin 'ctrap'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"""""""""""""""""""""""""
"     Vundle设置        "
"""""""""""""""""""""""""
let g:acp_completeoptPreview = 1

"""""""""""""""""""""""""
"     syntastic设置        "
"""""""""""""""""""""""""

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -pedantic -Wall -g '

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0



"""""""""""""""""""""""""
"     ctags设置        "
"""""""""""""""""""""""""

set tags=tags;    "   其中 ; 不能没有
set autochdir

"""""""""""""""""""""""""
"     c.vim设置         "
"""""""""""""""""""""""""
let g:C_CFlags = '-std=c++11 -pedantic -Wall -g -c'      " compiler flags: compile, don't optimize
