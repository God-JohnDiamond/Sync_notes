" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"set shortmess=atI " 启动的时候不显示那个援助乌干达儿童的提示 
"winpos 5 5 " 设定窗口位置 
"set lines=40 columns=155 " 设定窗口大小 
set nu " 显示行号 
syntax on " 语法高亮 
set ruler " 显示标尺 
set showcmd " 输入的命令显示出来，看的清楚些 
"set go= " 不要图形按钮 
"set guifont=Courier_New:h10:cANSI " 设置字体 
autocmd InsertLeave * se nocul " 用浅色高亮当前行 
autocmd InsertEnter * se cul " 用浅色高亮当前行 
set cmdheight=1 " 命令行（在状态行下）的高度，设置为1 
"set whichwrap+=<,>,h,l " 允许backspace和光标键跨越行边界(不建议) 
"set scrolloff=3 " 光标移动到buffer的顶部和底部时保持3行距离 
set novisualbell " 不要闪烁(不明白) 
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")} "状态行显示的内容 
set laststatus=1 " 启动显示状态行(1),总是显示状态行(2) 
"set foldenable " 允许折叠 
"set foldmethod=manual " 手动折叠 
"set background=dark "背景使用黑色 
set nocompatible "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限 
" 显示中文帮助
"if version >= 603
"set helplang=cn
"set encoding=utf-8
"endif

" 代码补全 
set completeopt=preview,menu 
" 自动缩进
set autoindent
"set cindent
" Tab键的宽度
set tabstop=4
" 统一缩进为4
"set softtabstop=4
"set shiftwidth=4
" 用空格代替制表符
set expandtab
" 粘贴不缩进
"set paste

set fileencodings=utf-8,gb2312,gbk,gb18030,big5
set fenc=utf-8
set enc=utf-8
