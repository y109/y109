"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM BASE_SETTING start
"-----------------------------------------------------------------
if v:version < 700
    finish
endif

" note "{{{

" f{char} 到右侧第 [count] 次出现的字符 {char}。光标放在 {char} 上,F 向左
" t{char} 到右侧第 [count] 次出现的字符 {char} 之前。光标放在{char} 左边
" ; 左重复 f/t , 右重复 f/t
"
" [[ \ ]] 会在 { 上下跳转
" "}}}
"
" 在终端的 title 上显示当前文件名 
set title

" 解释 bash alias
:set shellcmdflag=-ic

" 关闭vi兼容模式，不使用vi的键盘模式
set nocompatible

" 显示行号
" set nu
set number

" 显示相对行号
" set rnu
" set relativenumber

" 在输入部分查找模式时显示相应的匹配点。
set incsearch

" 使用中文菜单
" set langmenu=zh_CN.UTF-8

" 在处理未保存或只读文件的时候，弹出确认
set confirm

" 定义一个使用 "mapleader" 变量的映射，可以使用特殊字串 "<Leader>"。它会被 "mapleader" 的字串值所替换。如果 "mapleader" 未设置或为空，则用反斜杠代替
let mapleader=","

" 与windows共享剪贴板
set clipboard+=unnamed

" 用 CursorLine |hl-CursorLine| 高亮光标所在的屏幕行。用于方便定位光标。
set cursorline
" highlight CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

" 高亮列
" set cuc
" set cursorcolumn
" highlight CursorColumn cterm=NONE ctermbg=black ctermfg=white guibg=darkred guifg=white


"默认情况下，在 VIM 中当光标移到一行最左边的时候，我们继续按左键，光标不能回到上一行的最右边。
"同样地，光标到了一行最右边的时候，我们不能通过继续按右跳到下一行的最左边。
"但是，通过设置 whichwrap 我们可以对一部分按键开启这项功能。
"如果想对某一个或几个按键开启到头后自动折向下一行的功能，
"可以把需要开启的键的代号写到 whichwrap 的参数列表中，各个键之间使用逗号分隔。
"以下是 whichwrap 支持的按键名称列表：
"b "在 Normal 或 Visual 模式下按删除(Backspace)键。
"s "在 Normal 或 Visual 模式下按空格键。
"h "在 Normal 或 Visual 模式下按 h 键。
"l "在 Normal 或 Visual 模式下按 l 键。
"< "在 Normal 或 Visual 模式下按左方向键。
"> "在 Normal 或 Visual 模式下按右方向键。
"~ "在 Normal 模式下按 ~ 键(翻转当前字母大小写)。
"[ "在 Insert 或 Replace 模式下按左方向键。
"] "在 Insert 或 Replace 模式下按右方向键。
set whichwrap=b,s,<,>,[,]

" 一个单词由字符、数字和下划线序列或者其他的非空白字符的序列组成。单词间可以空白字符 (空格、制表、换行) 分隔。这一规则可以用 'iskeyword' 选项改变。空行也被认作单词。
" 在 e,E,ge,gE,b,B 移动光标时会有影响
" set iskeyword+=_,$,@,%,#

" 显示括号配对情况
" When a bracket is inserted, briefly jump to a matching one
set showmatch

" 给出当前缓冲区的 <EOL> 格式，用于从文件读入缓冲区和把缓冲区写回文件
set fileformat=unix

" 给出换行符 (<EOL>) 的格式
set fileformats=unix,dos,mac

" 显示不可见字符，行尾加上
set list

" 'list' 模式和 |:list| 命令使用的字符串。这是逗号分隔的字符串设置的列
" set listchars=tab:>-,eol:<,trail:-
set listchars=tab:>-,trail:-

" 设定默认解码
" 设置当前字符编码为 UTF-8。UTF-8 是支持字符集最多的编码之一，在 UTF-8
" 下进行工作，会带来许多方便之处。由于 VIM 在运行过程中切换 encoding
" 会造成许多问题，如提示信息乱码、register 丢失等，因此强烈建议大家在启动 VIM
" 的时候把 encoding 设置为 UTF-8，在编辑非 UTF-8 的文件时，通过 fileencoding
" 来进行转码。
set encoding=utf-8

" 设置编码的自动识别。
" http://edyfox.codecarver.org/html/vim_fileencodings_detection.html
" set fencs=utf-8,gbk,gb2312
set fileencodings=utf-8,gbk,gb2312

set fileencoding=utf-8

set termencoding=utf-8

" ambw
" 只有在 'encoding' 为 "utf-8" 或别的 Unicode 编码时才有效。
" 用两个字节宽度显示特殊符号
set ambiwidth=double

" bs
" 这指明在插入模式下在哪里允许 <BS> 删除光标前面的字符。逗号分隔的三个值分别指：
" 行首的空白字符，换行符和插入模式开始处之前的字符。
set backspace=indent,eol,start

" ai
" 打开普通文件的自动缩进, 这使 Vim 在启动一个新行的时候使用与前一行一样的缩进。就是说，新行前面会有同样
" 多的空白字符。启动新行是指用 <Enter> 换行，在普通模式下执行 "o" 命令等情况。
" 置位 'paste' 选项时，'autoindent' 选项被复位。
set autoindent

" 这个命令保存 50 个命令和 50 个查找模式的历史。
set history=50

" 总在 vim 窗口的右下角显示当前光标位置。
set ruler

" ls
" 显示状态栏 0:永不 1:只有在多于一个窗口时（默认）2:总是
set laststatus=2

" stl
" 状态栏内容printf 风格 %-0{minwid}.{maxwid}{item}
" F:完整文件名 m:修改标志位 r:只读标志位 h:帮助缓冲区标志位 w:预览窗口标志位
"
set statusline=%<\ %1*%F%h%m%r\ %2*\ [%l,%v]\ [%{&ff}]\%9*%=%b\ 0x%B\ \ %{strftime(\"%Y-%m-%d\ %H:%M:%S\")}\ %3*\ %02P\
" highlight User1 term=bold cterm=bold ctermbg=white ctermfg=darkblue
highlight User1 ctermbg=white ctermfg=darkblue
highlight User2 ctermbg=darkgray ctermfg=white
highlight User3 ctermbg=white ctermfg=black
highlight User9 ctermbg=darkgray ctermfg=black

" 始终显示Tab栏
set showtabline=2

" Tab显示格式
" set tablise+=%<\ %F%h%m%r\ [%{&ff}]%=%{strftime(\"%Y-%m-%d\ %H:%M:%S\")}\ \
"
" 在 Vim 窗口右下角，标尺的右边显示未完成的命令。例如，当你输入 "2f"，Vim 在等
" 你输入要查找的字符并且显示 "2f"。当你再输入 w，"2fw" 命令被执行，"2f" 自动消失。
set showcmd

" 光标上下两侧最少保留的屏幕行数。这使你工作时总有一些可见的上下文。
set scrolloff=5

" 缩进取整到 'shiftwidth' 的倍数。应用于 > 和 < 命令。插入模式里的
set shiftround

" 'wildmenu' 打开时，命令行补全以增强模式运行
set wildmenu

" 用 'widechar' 指定的字符所用的补全模式
"   - on first <Tab>, when more than one match, list all matches and complete
"     the longest common  string
"   - on second <Tab>, complete the next full match and show menu
set wildmode=list:longest,full

" 文件和目录名的补全中忽略符合其中任何模式的文件
:set wildignore+=*.o,*.obj,*.bak,*.git,*.pyc,*.exe

" 备份
set writebackup
set backup
" 备份目录
set backupdir=/tmp
" 交换文件
set directory=/tmp//

if isdirectory(expand("~/.Trash"))
    set backupdir=~/.Trash
    set directory=~/.Trash
endif

" 每分钟备份一个
autocmd BufWritePre * let &bex = '-' . strftime("%Y%m%d-%H%M") . '.bak'

" 自动把内容写回文件
" set autowrite
" 插入模式里: 插入 <Tab> 时使用合适数量的空格代替
" 若希望插入真正的 TAB的话，按CTRL-V<Tab>
set expandtab

" 缩进每一步使用的空白数目。用于 |'cindent'|、|>>|、|<<| 等
set shiftwidth=4

" 文件里的 <Tab> 代表的空格数
set tabstop=4

" 插入模式下的自动补全选项
set completeopt=menu,menuone,longest,preview

" 输入这么多个字符以后，把交换文件写入磁盘。如果为零，连交换文件都不会建
set updatecount=20


" viminfo
"
" '20  - remember marks for 20 previous file
" \"50 - save 50 lines for each register
" :20  - remember 20 items in command-line history
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file
set viminfo='20,\"50,:20,%,n~/.viminfo

" set sessionoptions='blank,buffers,curdir,folds,help,options,tabpages,winsize'
" set sessionoptions=globals,buffers,curdir,folds,help,options,tabpages
" vimdiff
:set diffopt=filler,context:9

" bg
" 设为 "dark" 时，Vim 试图使用深色背景上看起来舒服的颜色。
" 如果设为 "light"，Vim 会试图使用在浅色背景上看起来舒服的颜色。
set background=dark

" 激活语法高亮
syntax on

" 高亮上次查找模式匹配的地方
set hlsearch

" find 的路径
:set path=.,/usr/include,,**

"-----------------------------------------------------------------
" VIM BASE_SETTING end
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VAR start
"-----------------------------------------------------------------
let g:os = substitute(system('uname'), '\n', '', '')
let g:hostname = substitute(system('hostname'), '\n', '', '')
" let g:pwd = substitute(system('pwd'), '\n', '', '')
let g:pwd = getcwd()
autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | let g:filename = expand('%:p') | endif
"-----------------------------------------------------------------
" VAR end
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{
" PLUGIN start
" }}}
"-----------------------------------------------------------------
filetype off
" 插件列表 http://vim-scripts.org/vim/scripts.html

" https://github.com/tpope/vim-pathogen
call pathogen#infect()

" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Color "
Bundle 'jellybeans.vim'
Bundle 'badwolf'
Bundle 'peaksea'
Bundle 'altercation/vim-colors-solarized'
" 插件
" 自动补齐
Bundle 'Shougo/neocomplcache.git'
" 自动完成
Bundle 'Shougo/neosnippet.git'
" snipmate 定义文件
Bundle 'snipmate-snippets'
" 注释插件
Bundle 'scrooloose/nerdcommenter.git'
" 彩色状态栏插件
Bundle 'Lokaltog/vim-powerline.git'
" 切换配色的插件
Bundle 'ScrollColors'
" 日历插件
Bundle 'mattn/calendar-vim.git'
" 比较文件夹的插件
" Bundle 'DirDiff.vim'
" 自动补齐括号
Bundle 'AutoClose'
" Grep
Bundle 'grep.vim'
" 可视化缩进
Bundle 'nathanaelkane/vim-indent-guides.git'
" 加强 % 匹配的能力
Bundle 'matchit.zip'

" taglist"
Bundle 'taglist.vim'
" tagbar
Bundle 'Tagbar'
" Doxgen
Bundle 'DoxygenToolkit.vim'
" 最近打开的文件
Bundle 'mru.vim'
let MRU_Exclude_Files = '^\/var\/.*\/svn-.*\|^/tmp/.*\|^/var/tmp/.*'
" 语法检查
" Bundle 'Syntastic'
Bundle 'Simple-Javascript-Indenter'
Bundle 'html-xml-tag-matcher'
Bundle 'xml.vim'
Bundle 'maksimr/vim-jsbeautify'
" bck search
" curl http://betterthangrep.com/ack-standalone > ~/bin/ack && chmod 0755 !#:3
Bundle 'mihaifm/bck'

" 类似 bck 的一个搜索工具
Bundle 'rking/ag.vim'
let g:agprg="/usr/local/bin/ag --column"

" Dash
" Bundle 'rizzatti/funcoo.vim'
" Bundle 'rizzatti/dash.vim'

" 快速导航
Bundle 'ctrlp.vim'
" 路径从哪个开始匹配
" C-t 在新 tab 打开文件
let g:ctrlp_working_path_mode = 'w'
" 切换模式 <C-f> <C-b>

" C_Y 时在哪个窗口打开文件
let g:ctrlp_open_new_file = 't'
let g:ctrlp_open_multiple_files = '9tjr'

" 自动修改引号
Bundle 'surround.vim'

" cocoa
Bundle 'cocoa.vim'

" A
Bundle 'a.vim'

" 输入方法时在状态栏显示方法定义
" ctags -R --fields=+lS
Bundle 'echofunc.vim'
"-----------------------------------------------------------------
" 与系统共享粘贴版
" 保证安装了 screen 和 tmux
" Bundle 'kana/vim-fakeclip'

Bundle 'L9'
Bundle 'FuzzyFinder'

" 自动划分窗口
Bundle 'zhaocai/GoldenView.Vim'
" 默认的快捷键与系统的有冲突
let g:goldenview__enable_default_mapping = 0
" 1. split to tiled windows
" nmap <silent> <C-L>  <Plug>GoldenViewSplit
nmap <silent> <C-S>  <Plug>GoldenViewSplit

" 2. quickly switch current window with the main pane
" and toggle back
nmap <silent> <F8>   <Plug>GoldenViewSwitchMain
nmap <silent> <S-F8> <Plug>GoldenViewSwitchToggle

" 3. jump to next and previous window
nmap <silent> <C-N>  <Plug>GoldenViewNext
nmap <silent> <C-P>  <Plug>GoldenViewPrevious

" 不再使用的插件
" Bundle 'crooloose/nerdtree.git'
"
filetype plugin indent on     " required

" -------------------------------------------------------------------
" 配色方案
colorscheme badwolf

" ScrollColor
" 切换颜色的插件
" http://www.vim.org/scripts/script.php?script_id=1488
" wget http://www.vim.org/scripts/download_script.php?src_id=5966 -O ~/.vim/plugin/ScrollColor.vim
:nmap <Leader>csc :COLORSCROLL<CR>
"-----------------------------------------------------------------

" netrw

:nmap <silent> <Leader>ve :30Sexplore!<CR>

" 显示/关闭横幅
let g:netrw_banner = 0

" v 用垂直分割在新浏览窗口中进入光标所在的文件/目录,分割后的新窗口出现在右方而不是左
let g:netrw_altv = 1

" 指定 "o" (见 |netrw-o|)、"v" (见 |netrw-v|)、 |:Hexplore| 或 |:Vexplore| 建立的新窗口的初始大小。
let g:netrw_winsize = 100

" 以树形列表显示文件列表
let g:netrw_liststyle=3

" |g:netrw_browse_split| 选项缺省为零。可以修改它，使文件的打开在新窗口或标签页
" 里进行。如果该选项为一，分割会以水平方式进行，如果为二，分割以垂直方式进行。如
let g:netrw_browse_split=3

" x:用系统程序查看文件
let g:netrw_browsex_viewer = "open"

 " (缺省) 浏览目录时不影响当前目录。
let g:netrw_keepdir = 1
"-----------------------------------------------------------------
" NERDTree
"
" ~/.vim/bundle/nerdtree
" git clone http://github.com/crooloose/nerdtree.git
" git pull origin

" Increase window size to 35 column
" let NERDTreeWinSize=35

" 打开或者关闭 NERDTree 窗口
" :nmap <silent> <Leader>ft :NERDTreeToggle<CR>

" NERDTree 中选中当前文件
" :nmap <Leader>fc :NERDTreeFind<CR>


"-----------------------------------------------------------------
" NERD_commenter.vim 注释代码用的
" http://www.vim.org/scripts/script.php?script_id=1218
" git clone https://github.com/scrooloose/nerdcommenter.git
"
" [count],cc 光标以下count行逐行添加注释(7,cc)
" [count],cu 光标以下count行逐行取消注释(7,cu)
" [count],cm 光标以下count行尝试添加块注释(7,cm)
" ,cA 在行尾插入 /* */,并且进入插入模式。 这个命令方便写注释
" 注：count参数可选，无则默认为选中行或当前行
" 切换注释
" [count]<leader>ci |NERDComInvertComment|
"
" 切换注释方式 // 或 /* */
" <leader>ca |NERDComAltDelim|

" [count]<leader>cn |NERDComNestedComment|
" Same as <leader>cc but forces nesting.
"
" [count]<leader>c |NERDComToggleComment|
" Toggles the comment state of the selected line(s). If the topmost selected
"
" [count]<leader>cs |NERDComSexyComment|
" Comments out the selected lines ``sexily''
"
" [count]<leader>cy |NERDComYankComment|
" Same as <leader>cc except that the commented line(s) are yanked first.
"
" <leader>c$ |NERDComEOLComment|
" Comments the current line from the cursor to the end of line.
"
" |NERDComInsertComment|
" Adds comment delimiters at the current cursor position and inserts between.
" Disabled by default.
"
"
" [count]<leader>cl
" [count]<leader>cb |NERDComAlignedComment|
" Same as |NERDComComment| except that the delimiters are aligned down the
" left side (<leader>cl) or both sides (<leader>cb).
"
:let NERDSpaceDelims = 1       " 让注释符与语句之间留一个空格
:let NERDCompactSexyComs = 1   " 多行注释时样子更好看

"-----------------------------------------------------------------
" neocomplcache 自动补齐插件
" http://www.vim.org/scripts/script.php?script_id=2620
" git clone https://github.com/Shougo/neocomplcache.git

" Disable AutoComplPop. Comment out this line if AutoComplPop is not installed.
let g:acp_enableAtStartup = 0
" Launches neocomplcache automatically on vim startup.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underscore completion.
let g:neocomplcache_enable_underbar_completion = 1
" Sets minimum char length of syntax keyword.
let g:neocomplcache_min_syntax_length = 3
" buffer file name pattern that locks neocomplcache. e.g. ku.vim or fuzzyfinder
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define file-type dependent dictionaries.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : expand('~/.vimshell_hist'),
    \ 'scheme' : expand('~/.gosh_completions')
    \ }

" Define keyword, for minor languages
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" 用回车选择匹配项目
" http://udonmai.com/work/make-neocomplcache-snipmate-work-well-togethe.html
" inoremap <expr><Enter>  pumvisible() ? "\<C-Y>" : "\<Enter>"

" 使用SPACE 匹配项目
inoremap <expr><space> pumvisible() ? neocomplcache#close_popup() . "\<SPACE>" : "\<SPACE>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" 取消TAB 相关配置 <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
" let g:neocomplcache_enable_auto_select = 1
" 启用快速匹配，打开这个开关后，每次补全菜单弹出时，可以再按一个”-“键，这是补全菜单中的每个候选词会被标上一个字母，只要再输入对应字母就可以马上完成选择。
let g:neocomplcache_enable_quick_match = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion. Not required if they are already set elsewhere in .vimrc
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion, which require computational power and may stall the vim.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

"-----------------------------------------------------------------
" neosnippet

" Plugin key-mappings.
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" 使用额外的snippets
" git clone https://github.com/honza/snipmate-snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate-snippets/snippets'

"-----------------------------------------------------------------
" ctags
"
" http://pkgs.fedoraproject.org/repo/pkgs/ctags/ctags-5.8.tar.gz/c00f82ecdcc357434731913e5b48630d/ctags-5.8.tar.gz
" svn co https://ctags.svn.sourceforge.net/svnroot/ctags ctags
"
" 自动寻找父类的 tags 定义
:set tags=tags;/

"-----------------------------------------------------------------

" 在新tab里打开TAG
:nmap <silent><Leader>tt <C-w><C-]><C-w>T

" 在右测里打开TAG
:nmap <silent><Leader>tl <C-w><C-]><C-w>L

"-----------------------------------------------------------------
" cscope
" 生成 cscope index file
" cscope -Rb
"-----------------------------------------------------------------
" 更新 cscope 文件
:nmap <Leader>sr :!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files<CR>
  \:!cscope -b -i cscope.files -f cscope.out<CR>
  \:cs reset<CR>

" 自动载入父目录中的 cscope
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction

if has("cscope")
    set csprg=/usr/local/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
        " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
    autocmd BufEnter /* call LoadCscope()

endif

" 0 或 s: 查找本 C 符号
:nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
:nmap <Leader>ss :cs find s <C-R>=expand("<cword>")<CR><CR>
" 1 或 g: 查找本定义
" nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
:nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
:nmap <Leader>sg :cs find g <C-R>=expand("<cword>")<CR><CR>
" 2 或 d: 查找本函数调用的函数
" 3 或 c: 查找调用本函数的函数
:nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
:nmap <Leader>sc :cs find c <C-R>=expand("<cword>")<CR><CR>
" 4 或 t: 查找本字符串
:nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
:nmap <Leader>st :cs find t <C-R>=expand("<cword>")<CR><CR>
" 6 或 e: 查找本 egrep 模式
" 7 或 f: 查找本文件
" 8 或 i: 查找包含本文件的文件
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"-----------------------------------------------------------------
" Grep 插件
" http://www.vim.org/scripts/script.php?script_id=311
:nmap <Leader>gr :Rgrep<CR>

"-----------------------------------------------------------------
" vim-powerline
" 彩色状态栏插件
" git clone https://github.com/Lokaltog/vim-powerline
" 需要下载一个字体
" https://github.com/Lokaltog/vim-powerline/wiki/Patched-fonts
" 然后配置本项目，状态栏显示才能正常
let g:Powerline_symbols = 'fancy'
"-----------------------------------------------------------------
" TagList.vim
" http://www.vim.org/scripts/script.php?script_id=273
"
" :nmap <silent> <Leader>vt :TlistToggle<CR>
"-----------------------------------------------------------------
" Tagbar
:nmap <silent> <Leader>vt :TagbarToggle<CR>
" 自动关闭
let g:tagbar_autoclose = 1
" 自动选中Tag
let g:tagbar_autofocus = 1
" autocmd FileType c,cpp nested :TagbarOpen

let Tlist_Display_Prototype = 0
let Tlist_Sort_Type = "order"
let tlist_php_settings='php;c:Classes;f:Functions;d:Constants;j:Javascript Functions'
nmap <Leader>ct :!ctags -R --exclude="\.svn" --totals=yes --tag-relative=yes --PHP-kinds=+cf --regex-PHP='/abstract class ([^ ]*)    /\1/c/' --regex-PHP='/interface ([^ ]*)/\1/c/' --regex-PHP='/(public \|static \|abstract \|protected \|private )+function ([    ^ ()]*)/\2/f/'

"不同时显示多个文件的tag，只显示当前文件的
let Tlist_Show_One_File = 1

"如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Exit_OnlyWindow = 1

" 在右侧窗口中显示taglist窗口
let Tlist_Use_Right_Window = 1

" 打开Taglist 时，输入焦点在taglist中
let Tlist_GainFocus_On_ToggleOpen=1

"-----------------------------------------------------------------
" 日历
" http://www.vim.org/scripts/script.php?script_id=52
" wget http://www.vim.org/scripts/download_script.php?src_id=14880 -O calendar.vim
" :nmap <Leader>cal :Calendar<CR>
"-----------------------------------------------------------------
" FuzzyFinder
:nmap <silent> <Leader>vg :FufFile<CR>

"-----------------------------------------------------------------
"
" http://www.vim.org/scripts/download_script.php?src_id=16171
" 文件夹对比
" :DirDiff <A:Src Directory> <B:Src Directory>
"
"  Sets default exclude pattern:
let g:DirDiffExcludes = ".svn,CVS,*.class,*.exe,.*.swp"

" Sets default ignore pattern:
let g:DirDiffIgnore = "Id:,Revision:,Date:"
"-----------------------------------------------------------------
" 缩进可视化插件
" 默认快捷键 <Leader>ig
" https://github.com/mutewinter/vim-indent-guides
" 自动计算颜色
let g:indent_guides_auto_olors = 1

" let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 0

"-----------------------------------------------------------------
" phpErrorMarker make 时自动检查PHP语法错误
"
let g:phpErrorMarker#automake = 0
"-----------------------------------------------------------------
"

"-----------------------------------------------------------------
map <Leader>fj :call JsBeautify()<cr>
" or
" autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
" autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
" autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
"-----------------------------------------------------------------
" PLUGIN end
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAP CONFIG start
" -------------------------------------------------------------------
" 快捷键超时时间
" set timeoutlen=3000

" 切换tab 的快捷键
:map 11 :tabnext 1<CR>
:map 22 :tabnext 2<CR>
:map 33 :tabnext 3<CR>
:map 44 :tabnext 4<CR>
:map 55 :tabnext 5<CR>
:map 66 :tabnext 6<CR>
:map 77 :tabnext 7<CR>
:map 88 :tabnext 8<CR>
:map 99 :tabnext 9<CR>


" 上一个标签
" = gT
:map __ :tabprevious<CR>

" 下一个标签
" = gt
:map ++ :tabnext<CR>

" 显示所有marks
:nnoremap <Leader>vm :marks<CR>

" 执行当前行
" 同 "ayy@a
:nmap <Leader>lr <Esc>yy@"

" 退出
:nmap <Leader>q :q<CR>
:nmap <Leader>Q :qall<CR>

" sudo 存档
:nmap <Leader>fws :w !sudo tee %

" 行首
:nmap <Leader>la ^

" 行尾
:nmap <Leader>le $

" 列出所有键盘映射
:nmap <Leader>lm :map<CR>

" 显示选项
:nmap <Leader>vo :help options<CR>

" 切换是否显示行号
" nmap <Leader>vn :set number!<CR>
:nmap <Leader>vn :set invnumber<CR>

" 显示寄存器
:nmap <Leader>vr :reg<CR>

" 当前窗口垂直划分成两个
:nmap <Leader>wv <C-W>v

" 光标跳到左边窗口
:nmap <Leader>wh <C-W><Left>

" 光标跳到下边窗口
:nmap <Leader>wj <C-W><Down>

" 光标跳到上边窗口
:nmap <Leader>wk <C-W><Up>

" 光标跳到右边窗口
:nmap <Leader>wl <C-W><Right>

" 光标跳转到最顶上的窗口
:nmap <Leader>wt <C-W>t

" 光标跳转到最底下的窗口
:nmap <Leader>wb <C-W>b

" 窗口移到最上边
:nmap <Leader>wK <C-W>K

" 窗口移到最下边
:nmap <Leader>wJ <C-W>J

" 窗口移到最左边
:nmap <Leader>wH <C-W>H

" 窗口移到最右边
:nmap <Leader>wL <C-W>L

" 窗口移到新Tab里
" 注意:tab split 会建立一个新的标签页，包含一个窗口，编辑和刚才所在窗口中的缓冲区相同的缓冲
:nmap <Leader>wT <C-W>T

" 在新tab里打开当前光标下的文件
:map gf :e <cfile><CR>

" 上移本行
:nmap <Leader>lj :m-2<CR>

" 下移本行
:nmap <Leader>lk :m+<CR>

" 列出当前光标所在的行的所有的匹配，然后选择一个并跳转之
" [I 在当前文件中搜索所有这个单词
:nmap <Leader>sn [I:let index = 1<Bar>let index = input("第几个? ")<Bar>exe "normal " . index ."[\t"<Bar>unlet index<CR>

" 插入当前路径
:imap <Leader>ap :r !pwd<CR>A
" :imap <Leader>ap redir => m | silent echo g:pwd | redir END | put=m

" 插入当前时间
:imap <Leader>at <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>

" _dd 不把删除的文本存在任何寄存器里。
" :nmap <Leader>dd "_dd
:nmap <Leader>dd "xdd

" vifile
" 编辑.vimrc 文件
:nmap <Leader>vv :tabedit $MYVIMRC<CR>

" 切换复制粘贴模式
" Use F10 to toggle 'paste' mode
" set pastetoggle=<F10>
" 切换到粘贴模式
" set paste
:nmap <Leader>mc :set paste!<CR>
:imap <Leader>p <Esc>:set paste!<CR>i

" SVN
" map <Leader>sd :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg
Bundle 'vcscommand.vim'
map <Leader>sd :VCSVimDiff<CR>

" 再新 tab 打开 .h 或者 .cpp
:map <Leader>th :tabnew %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" 重新载入 .vimrc 配置
:nmap <Leader>rv :source $MYVIMRC<CR>

" 命令模式下, 支持常用的快捷键
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" 把文件转换为 utf-8 编码
:nmap <Leader>f8 :set nobomb<CR>:set fileencoding=utf-8<CR>:set fileformat=unix<CR>

" 把工作目录设置为当前目录
nnoremap <Leader>. :lcd %:p:h<CR>
" -------------------------------------------------------------------
" MAP CONFIG end
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTIONS start
" -------------------------------------------------------------------

" 删除行尾空格
if !exists("*TrimWhiteSpace")
function TrimWhiteSpace()
    %s/\s*$//
    ''
endfunction
endif

" 显示TAB Index
" http://superuser.com/questions/331272/vim-show-the-index-of-tabs-in-the-tabline
" (Based on http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function)
if exists("+showtabline")
function! MyTabLine()
    let s = ''
    let wn = ''
    let t = tabpagenr()
    let i = 1
    while i <= tabpagenr('$')
        let buflist = tabpagebuflist(i)
        let winnr = tabpagewinnr(i)
        let s .= '%' . i . 'T'
        let s .= (i == t ? '%1*' : '%2*')
        let s .= ' '
        let wn = tabpagewinnr(i,'$')

        let s .= '%#TabNum#'
        let s .= i
        " let s .= '%*'
        let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
        let bufnr = buflist[winnr - 1]
        let file = bufname(bufnr)
        let buftype = getbufvar(bufnr, 'buftype')
        if buftype == 'nofile'
            if file =~ '\/.'
                let file = substitute(file, '.*\/\ze.', '', '')
            endif
        else
            let file = fnamemodify(file, ':p:t')
        endif
        if file == ''
            let file = '[No Name]'
        endif
        let s .= ' ' . file . ' '
        let i = i + 1
    endwhile
    let s .= '%T%#TabLineFill#%='
    let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
    return s
endfunction
set stal=2
set tabline=%!MyTabLine()
highlight link TabNum Special
endif

if !exists("*AddHeader")
function! AddHeader()
    call append(1,"/**")
    call append(2," *")
    call append(3," * 作者:Gavinyao (gavinyao@tencent.com)")
    call append(4," * 创建时间:".strftime("%Y-%m-%d %H:%M:%S"))
    call append(5," * 修改记录:")
    call append(6," * @errorCode: []")
    call append(7," * $Id$")
    call append(8," **/")
endfunction
endif
:nmap <Leader>ah :call AddHeader()<CR>

" -------------------------------------------------------------------
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

" From an idea by Michael Naumann
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" 搜索选中的东西 Basically you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>
vnoremap <silent> gv :call VisualSearch('gv')<CR>
" -------------------------------------------------------------------
" FUNCTIONS end
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FILETYPE CONFIG start
" -------------------------------------------------------------------
" 设置文件类型
let filetype_m='objc'

" 如果文件类型没有自动检测到可以手动设置
:autocmd BufRead,BufNewFile *.phpt setfiletype php
:autocmd BufRead,BufNewFile *.jce setfiletype cpp
:autocmd BufRead,BufNewFile hosts setfiletype conf

" PHP
" http://www.vim.org/scripts/script.php?script_id=1571
" -------------------------------------------------------------------
" JavaScript
" wget http://www.vim.org/scripts/download_script.php?src_id=10728 -O ~/.vim/syntax/javascript.vim
" -------------------------------------------------------------------
"  jquery
" http://www.vim.org/scripts/script.php?script_id=2416
" wget http://www.vim.org/scripts/download_script.php?src_id=15752 -O jquery.vim
autocmd BufRead,BufNewFile jquery.*.js set filetype=javascript syntax=jquery
"-------------------------------------------------------------------
" Cocoa
" http://www.vim.org/scripts/script.php?script_id=2674
"-------------------------------------------------------------------
" 文件类型探测 使用文件类型相关的插件 使用缩进文件
filetype plugin indent on

"-----------------------------------------------------------------
" vim-doc-php Manual
" K，显示php文档
" 安装 pman
" pear 在 lion 下有问题，sudo php /usr/lib/php/install-pear-nozlib.phar
" sudo pear channel-update doc.php.net
" sudo pear install doc.php.net/pman
:autocmd FileType php setlocal keywordprg=pman

" 进入文件时，返回上次编辑位置
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif
"-----------------------------------------------------------------
" FILETYPE CONFIG end
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INCLUDE start
"-----------------------------------------------------------------
let g:os_vimrc = $HOME . "/work/shell/etc/vim/" . g:os . '.vimrc'
if filereadable(g:os_vimrc)
    execute 'silent! source ' . g:os_vimrc
endif

let g:host_vimrc = $HOME . "/work/shell/etc/vim/host.d/" . g:hostname . '.vimrc'
if filereadable(g:host_vimrc)
    execute 'silent! source ' . g:host_vimrc
endif

"-----------------------------------------------------------------
" INCLUDE end
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
