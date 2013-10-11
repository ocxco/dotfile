" 自动加载配置文件，不用重启vim
autocmd! bufwritepost _vimrc source %
set backspace=indent,eol,start
" 
" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

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

colorscheme desert

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd     " Show (partial) command in status line.
"set showmatch   " Show matching brackets.
"set ignorecase  " Do case insensitive matching
"set smartcase   " Do smart case matching
"set incsearch   " Incremental search
"set autowrite   " Automatically save before commands like :next and :make
"set hidden      " Hide buffers when they are abandoned
set mouse=a      " Enable mouse usage (all modes)
set t_Co=256
set directory=/tmp

" 使vim中文化
" disable VI's compatible mode..
set nocompatible
" set encoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,default,latin1
" use chinese help
set helplang=cn
" show line number
set nu
" show unicode
set invlist

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>
let g:miniBufExplMapCTabSwitchBufs = 1
nnoremap <silent> <F3> :Grep<CR>
filetype plugin indent on " 打开文件类型检测
set completeopt=longest,menu

" 按Tab键自动补全
" let g:SuperTabRetainCompletionType=2
" let g:SuperTabDefaultCompletionType="<C-X><C-O>"

" 设置按下tab键属性
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" 设置自动加载tags 最多五层目录
if filereadable(".tags")
    set tags+=.tags
elseif filereadable("../.tags")
    set tags+=../.tags
elseif filereadable("../../.tags")
    set tags+=../../.tags
elseif filereadable("../../../.tags")
    set tags+=../../../.tags
elseif filereadable("../../../../.tags")
    set tags+=../../../../.tags
endif

" 设置自动载入cscope.out文件 
if filereadable("./cscope.out")
    cs add ./cscope.out 
elseif filereadable("../cscope.out")
    cs add ../cscope.out
elseif filereadable("../../cscope.out")
    cs add ../../cscope.out
elseif filereadable("../../../cscope.out")
    cs add ../../../cscope.out
elseif filereadable("../../../../cscope.out")
    cs add ../../../../cscope.out
endif
" 设置折叠方式
set fdm=indent " 更多的缩进表示更高级别的折叠
" manual 手工定于折叠
" syntax 用语法高亮来定义折叠
" indent 更多的缩进表示更高级别的折叠
" expr   用表达式来定义折叠
" diff   对没有更改的文本进行折叠
" marker 对文中的标志进行折叠
let color_normal = 'HotPink'
let color_insert = 'RoyalBlue1'
let color_exit = 'green'

" 改变光标颜色
if &term =~ 'xterm\|rxvt'
    exe 'silent !echo -ne "\e]12;"' . shellescape(color_normal, 1) . '"\007"'
    let &t_SI="\e]12;" . color_insert . "\007"
    let &t_EI="\e]12;" . color_normal . "\007"
    exe 'autocmd VimLeave * :!echo -ne "\e]12;"' . shellescape(color_exit, 1) . '"\007"'
elseif &term =~ "screen"
    if !exists('$SUDO_UID')
        if exists('$TMUX')
            exe 'silent !echo -ne "\033Ptmux;\033\e]12;"' . shellescape(color_normal, 1) . '"\007\033\\"'
            let &t_SI="\033Ptmux;\033\e]12;" . color_insert . "\007\033\\"
            let &t_EI="\033Ptmux;\033\e]12;" . color_normal . "\007\033\\"
            exe 'autocmd VimLeave * :!echo -ne "\033Ptmux;\033\e]12;"' . shellescape(color_exit, 1) . '"\007\033\\"'
        else
            exe 'silent !echo -ne "\033P\e]12;"' . shellescape(color_normal, 1) . '"\007\033\\"'
            let &t_SI="\033P\e]12;" . color_insert . "\007\033\\"
            let &t_EI="\033P\e]12;" . color_normal . "\007\033\\"
            exe 'autocmd VimLeave * :!echo -ne "\033P\e]12;"' . shellescape(color_exit, 1) . '"\007\033\\"'
        endif
    endif
endif
unlet color_normal
unlet color_insert
unlet color_exit

let g:EasyMotion_leader_key = ','

" 自动注释插件配置
let g:DoxygenToolkit_authorName="xuechaoc <xuechaoc@jumei.com>"
let s:licenseTag = "Copyright(C)\<enter>"
let s:licenseTag = s:licenseTag . "For free\<enter>"
let s:licenseTag = s:licenseTag . "All right reserved\<enter>"
let g:DoxygenToolkit_briefTag_pre=""
let g:DoxygenToolkit_licenseTag = s:licenseTag
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1

" cscope 命令
set cscopequickfix=s-,c-,d-,i-,t-,e-
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>x :cs find f 
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme='light'
let g:bufferline_echo = 0
set laststatus=2

" auto complete pop config
au FileType php setlocal dict+=~/.vim/bundle/vim-autocomplpop/dict/php_funclist.txt
if !exists('g:AutoComplPop_Behavior')
    let g:AutoComplPop_Behavior = {}
    let g:AutoComplPop_Behavior['php'] = []
    call add(g:AutoComplPop_Behavior['php'], {
        \   'command'   : "\<C-x>\<C-o>", 
        \   'pattern'   : printf('\(->\|::\|\$\)\k\{%d,}$', 0),
        \   'repeat'    : 0,
        \})
endif

" pathogen
execute pathogen#infect()

set runtimepath+=$HOME/.vim/phpmanual/
au FileType php set keywordprg="help"

" open-browser
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
nmap zx <Plug>(openbrowser-open)
vmap zx <Plug>(openbrowser-open)


" CoVim setting
let CoVim_default_name = 'cxc'
let CoVim_default_port = '12315'
