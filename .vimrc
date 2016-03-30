"""" 不要使用vi的键盘模式，而是vim自己的
set nocompatible
""""侦测文件类型
filetype on
""""history文件中需要记录的行数
set history=1000
""""在处理未保存或只读文件的时候，弹出确认
set confirm
""""与windows共享剪贴板
set clipboard+=unnamed
""""设置背景颜色
set background=dark
""""设置行号
set nu
""""语法高亮
syntax on
""""状态行颜色
highlight StatusLine guifg=SlateBlue guibg=Yellow
highlight StatusLineNC guifg=Gray guibg=White
set autoindent
set smartindent
""""设置tab键为4个空格，并且自动转换tab为四个空格
set tabstop=4
set expandtab
set autoindent
set shiftwidth=4
""""不要生成swap文件，当buffer被丢弃的时候隐藏它
setlocal noswapfile
set bufhidden=hide
""""高亮显示匹配的括号
set showmatch
""""在状态行上显示光标所在位置的行号和列号
set ruler
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%))
""""使回格键（backspace）正常处理indent, eol, start等
set backspace=2
""""在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
set incsearch
set showcmd
set autoread
set completeopt=preview,menu
""""设置编码
set encoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,ucs-bom,gbk,cp936,latin-1
""""设置不自动备份
set nobackup
""""启用鼠标
""""set mouse=a
""""自动补全括号引号
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
"""""设置大括号自动对齐
set cindent
""""inoremap < <><ESC>i
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
""""启用折叠
""""set foldenable
set foldmethod=syntax
" 用空格键来开关折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
set nofoldenable
" 当文件在外部被修改，自动更新该文件
set autoread
""""搜索模式忽略大小写
set ignorecase
" Ctrl + K 插入模式下光标向上移动
imap <c-k> <Up>
" Ctrl + J 插入模式下光标向下移动
imap <c-j> <Down>
" Ctrl + H 插入模式下光标向左移动
imap <c-h> <Left>
" Ctrl + L 插入模式下光标向右移动
imap <c-l> <Right>
" 每行超过180个的字符用下划线标示
au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 180 . 'v.\+', -1)
set laststatus=2                                      "启用状态栏信息
set statusline=%t\ %1*%m%*\ %1*%r%*\ %2*%h%*%w%=%l%3*/%L(%p%%)%*,%c%V]\ [%b:0x%B]\ [%{&ft==''?'TEXT':toupper(&ft)},%{toupper(&ff)},%{toupper(&fenc!=''?&fenc:&enc)}%{&bomb?',BOM':''}%{&eol?'':',NOEOL'}]






""""""""""""""""""""""
"""""新文件标题""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java,.py,.js文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.tex,*.py,*.js,*.java,*.txt exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1, "\#!/bin/bash") 
        call append(line("."),"\#************************************************************************") 
        call append(line(".")+1, "\# File Name: ".expand("%")) 
        call append(line(".")+2, "\# Author: quicy") 
        call append(line(".")+3, "\# Email: xiqian013@live.com") 
        call append(line(".")+4, "\# Created Time: ".strftime("%Y-%m-%d %H:%M:%S")) 
        call append(line(".")+5, "\#************************************************************************") 
        call append(line(".")+6, "") 
	"如果文件类型为.py文件 
    endif
	if &filetype == 'python' 
		call setline(1, "\#!/usr/bin/python3") 
        call append(line("."), "\# -*- coding: <utf-8> -*-")
		call append(line(".")+1, "")
		call append(line(".")+2, "\#************************************************************************") 
        call append(line(".")+3, "\# File Name: ".expand("%")) 
        call append(line(".")+4, "\# Author: quicy") 
        call append(line(".")+5, "\# Email: xiqian013@live.com ") 
        call append(line(".")+6, "\# Created Time: ".strftime("%Y-%m-%d %H:%M:%S")) 
        call append(line(".")+7, "\#************************************************************************") 
        call append(line(".")+8, "")    
    endif
    "如果文件类型为.cpp文件 
    if &filetype == 'cpp'
        call setline(1, "/*************************************************************************") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "    > Author: quicy") 
        call append(line(".")+2, "    > Email: xiqian013@live.com ") 
        call append(line(".")+3, "    > Created Time: ".strftime("%Y-%m-%d %H:%M:%S")) 
        call append(line(".")+4, " ************************************************************************/") 
        call append(line(".")+5, "")
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "int main()")
		call append(line(".")+9, "{")
		call append(line(".")+10, "    return 0;")
		call append(line(".")+11, "}")
		call append(line(".")+12, "")    
    endif
    "如果文件类型为.c文件 
    if &filetype == 'c'
        call setline(1, "/*************************************************************************") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "    > Author: quicy") 
        call append(line(".")+2, "    > Email: xiqian013@live.com ") 
        call append(line(".")+3, "    > Created Time: ".strftime("%Y-%m-%d %H:%M:%S")) 
        call append(line(".")+4, " ************************************************************************/") 
        call append(line(".")+5, "")
        call append(line(".")+6, "#include<stdio.h>")
		call append(line(".")+7, "int main()")
		call append(line(".")+8, "{")
		call append(line(".")+9, "    return 0;")
		call append(line(".")+10, "}")
        call append(line(".")+11, "")
    endif
    "如果文件类型为.javascript文件 
    if &filetype == 'javascript'
        call setline(1, "/*************************************************************************") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "    > Author: quicy") 
        call append(line(".")+2, "    > Email: xiqian013@live.com ") 
        call append(line(".")+3, "    > Created Time: ".strftime("%Y-%m-%d %H:%M:%S")) 
        call append(line(".")+4, " ************************************************************************/") 
        call append(line(".")+5, "")
        call append(line(".")+6, "'use strict';")
    endif
    "如果文件类型为.java文件 
    if &filetype == 'java'
        call setline(1, "/**") 
        call append(line("."), " *@author:quicy") 
        call append(line(".")+1, " *@version:1.0") 
        call append(line(".")+2, " *File Name: ".expand("%")) 
        call append(line(".")+3, " *Email: xiqian013@live.com ") 
        call append(line(".")+4, " *Created Time: ".strftime("%Y-%m-%d %H:%M:%S")) 
        call append(line(".")+5, " */")
        call append(line(".")+6, "")
        call append(line(".")+7, "public class ".expand("%:r"))
        call append(line(".")+8, "{")
        call append(line(".")+9, "    public static void main (String []args)")
        call append(line(".")+10, "    {")
        call append(line(".")+11, "    }")
        call append(line(".")+12, "}")
    endif
    "如果文件类型为.tex文件
    if &filetype == 'plaintex'
        call setline(1, "%*************************************************************************") 
        call append(line("."), "%    > File Name: ".expand("%")) 
        call append(line(".")+1, "%    > Author: quicy") 
        call append(line(".")+2, "%    > Email: xiqian013@live.com ") 
        call append(line(".")+3, "%    > Created Time: ".strftime("%Y-%m-%d %H:%M:%S")) 
        call append(line(".")+4, "%************************************************************************") 
        call append(line(".")+5, "")
        call append(line(".")+6, "\\documentclass[UTF8,a4paper,12pt]{ctexart}")
        call append(line(".")+7, "\\usepackage{amsmath}")
        call append(line(".")+8, "\\usepackage{amssymb}")
        call append(line(".")+9, "\\usepackage{geometry}")
        call append(line(".")+10, "\\geometry{left=2.5cm,right=2.5cm,top=2.5cm,bottom=2.5cm}")
        call append(line(".")+11, "\\usepackage{hyperref}")
        call append(line(".")+12, "\\usepackage{\\baselineskip}{24pt}")
        call append(line(".")+13, "\\pagestyle{plain}")
        call append(line(".")+14, "\\begin{document}")
        call append(line(".")+15, "    \\section*{}")
        call append(line(".")+16, "\\end{document}")
    endif 
    "如果文件类型为.txt文件
    if &filetype == 'text'
        call setline(1, "/*************************************************************************") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "    > Author: quicy") 
        call append(line(".")+2, "    > Email: xiqian013@live.com ") 
        call append(line(".")+3, "    > Created Time: ".strftime("%Y-%m-%d %H:%M:%S")) 
        call append(line(".")+4, " ************************************************************************/") 
        call append(line(".")+5, "")
    endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""





"键盘命令
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>

" 映射全选+复制 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G
" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y
"去空行  
nnoremap <F2> :g/^\s*$/d<CR> 
"比较文件  
nnoremap <C-F2> :vert diffsplit 
"新建标签  
map <M-F2> :tabnew<CR>  
"列出当前目录文件  
map <F3> :tabnew .<CR>  
"打开树状文件目录  
map <C-F3> \be  
"C，C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!java %<"
    elseif &filetype == 'sh'
        :!./%
    endif
endfunc
"C,C++的调试
map <F8> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc
