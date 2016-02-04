" ======================================================
" I. From example
" ======================================================
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" ======================================================
" II. Zem's style
" ======================================================
" 

" 字符编码
" ---------------------
set encoding=utf-8 " 会导致中文菜单乱码
set nobomb
set langmenu=en_US
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"set langmenu=zh_CN.UTF-8
"language message zh_CN.UTF-8  会导致中文标题乱码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set ambiwidth=double
set ff=unix

" 页面风格
" ------------------
set number
colorscheme evening

"设置不自动换行
set nowrap

"显示下方的横向滚动条
set guioptions+=b

" 缩进线
"set list
"set listchars=tab:>-,precedes:-,trail:-

" 光标纵线
set cursorcolumn
" set cursorline

" 不要界面闪烁
set novisualbell

" 设置光标超过 80 列的时候折行。
" 不开启这个是因为，MLGB 的有时候不想你换行你能不能不换啊 - -....
" 但是，换个角度说你是不是可以不写那么长啊？？！！
" 好吧，继续开着
" 那个，有时候还是比较烦，还是关了吧。 2012-02-23
" set tw=80 

" 不在单词中间断行。设置了这个选项后，如果一行文字非常长，无法在一行内显示完的话，它会在单词与单词间的空白处断开，尽量不会把一个单词分成两截放在两个不同的行里。
set lbr
" 打开断行模块对亚洲语言支持。m 表示允许在两个汉字之间断行，即使汉字之间没有出现空格。B 表示将两行合并为一行的时候，汉字与汉字之间不要补空格。该命令支持的更多的选项请参看用户手册
set fo+=mB 
" 示括号配对情况。打开这个选项后，当输入后括号(包括小括号、中括号、大括号) 的时候，光标会跳回前括号片刻，然后跳回来，以此显示括号的配对情况。
set sm 
" 在命令模式下使用 Tab 自动补全的时候，将补全内容使用一个漂亮的单行菜单形式显示出来。
set wildmenu 
" 不使用“Shift + 方向键”选择文本，“Shift + 方向键”代表向指定方向跳一个单词。如果你喜欢这项功能的话，可以使用“set keymodel=startsel,stopsel”打开它。
set keymodel=startsel,stopsel


" tab 相关
" ---------------------
set expandtab
"TAG can show the dotted line.
"you can use :rtab to expendtab
"set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" 其他设置
" ---------------------
" 允许注释内设置
set modeline

"打开对文件类型插件的支持
" 上面是不是已经设置过了呀
filetype on
filetype plugin on
filetype plugin indent on

"设定文件浏览器目录为当前目录
set autochdir

"设置代码折叠的方式，这样每个program、module、subroutine、function都可以折叠了
" set foldmethod=syntax
" set fdm=indent

" 自动补齐字典

autocmd filetype javascript set dictionary=$_setting/dicts/javascript.dict
autocmd filetype css        set dictionary=$_setting/dicts/css.dict
autocmd filetype html       set dictionary=$_setting/dicts/html.dict
autocmd filetype php        set dictionary=$_setting/dicts/php.dict
autocmd filetype coffee     retab && set expandtab
autocmd filetype python     retab && set expandtab
autocmd filetype html       set expandtab
au BufNewFile,BufRead *.vue set filetype=html
au BufNewFile,BufRead *.ejs set filetype=html


set nowrap

" 将 swp 文件放这里
set directory=$_backup

" 插件管理
source $_setting/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect( $_plugins . '/{}' )

" GVIM 顶部菜单栏及显示
set guioptions-=m
set guioptions-=T
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>
" https://github.com/scrooloose/syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" https://github.com/mantoni/eslint_d.js#editor-integration
let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_javascript_exec = 'eslint'
let g:syntastic_javascript_eslint_args = "--parser babel-eslint --rule '{\"strict\": 0}'"
