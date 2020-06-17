" 去除vi一致性
set nocompatible

set number

syntax on

""""""""""""""
" set scheme "
""""""""""""""
let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置快捷键                                                     "
" 利用了映射的方法                                               "
" inoremap:                                                      "
"     i 插入模式下有效                                           "
"     nore 表示不递归，inoremap Y y和inoremap y Y并不会无限循环  "
"     map 映射                                                   "
" nnoremap:                                                      "
"     n 普通模式下有效                                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","        " leader 可设置为其他值
inoremap <leader>e <esc>        " 使用jo代替esc,如果要输入这两个字符，稍微等待一会儿即可
nnoremap B ^                            "使用B代替^
nnoremap E $                            "使用E代替$
nnoremap <leader><space> :nohlsearch<CR> "取消高亮
nnoremap <leader>w <C-W><C-K>           "窗口之间上下左右移动
nnoremap <leader>s <C-W><C-J>
nnoremap <leader>a <C-W><C-h>
nnoremap <leader>d <C-W><C-l>
nnoremap <leader>v :sp<CR>               "竖直分屏
nnoremap <leader>h :vs<CR>               "水平分屏
nnoremap <leader>q <C-W>q                "关闭当前窗口
nnoremap <leader>gfm :GenTocGFM<CR>          "用于markdown生成GFM风格目录
nnoremap <leader>redc :GenTocRedcarpet<CR>   "用于markdown生成Redcarpet风格的目录
" nnoremap <leader>upc :UpdateToc<CR>          "更新已有目录

autocmd Filetype go nnoremap <buffer> gd :call GodefUnderCursor()<CR> 
autocmd Filetype go nnoremap <buffer> <C-]> :call GodefUnderCursou()<CR>

" indent(删除退格) eol(合并两行) start(删除此前的掺入)
set backspace=indent,eol,start

""""""""""""""""""""""""""""""
"          设置缩进          "
""""""""""""""""""""""""""""""
"设置默认tab缩进
set tabstop=4
"设置默认softtabstop缩进,如果为6，则代表一个tab符和两个空格
set softtabstop=4
"设置默认每行最大字符数
set textwidth=80
"将tab符转换为空格
set expandtab
"设置自动缩进
set autoindent
"设置文件格式
set fileformat=unix

"设置python,go代码缩进
autocmd Filetype python,go setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix

"设置用于nodejs的代码缩进
autocmd Filetype javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 textwidth=79 expandtab autoindent fileformat=unix

"highlight matching [{()}]
"高光匹配成对的括号
set showmatch
"search as characters are entered
"根据输入的字符实时更新搜素结果
set incsearch
"highlight matches
"高亮搜索结果
set hlsearch

filetype off " 必须

"设置插件管理
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" 让vundle管理插件版本，必须
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'isRuslan/vim-es6'
Plugin 'pangloss/vim-javascript'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'marijnh/tern_for_vim'
Plugin 'plasticboy/vim-markdown'  " markdown高亮
Plugin 'mzlogin/vim-markdown-toc' " markdown生成标题
Plugin 'suan/vim-instant-markdown', {'rtp': 'after'} " 预览markdown
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-scripts/SuperTab'
Plugin 'fatih/vim-go'
Plugin 'rogpeppe/godef'
Plugin 'scrooloose/nerdtree'

" 插件结束
call vundle#end()            " 必须
filetype plugin indent on  " 必须
" 如果要忽视插件改变缩紧，使用以下代替：
filetype plugin on

"
" 簡要幫助文檔
" :PluginList       - 列出所有已配置的插件
" :PluginInstall    - 安裝插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地緩存
" :PluginClean      - 清除未使用插件,需要確認; 追加 `!` 自動批准移除未使用插件
"
" 查閱 :h vundle 獲取更多細節和wiki以及FAQ
" 將你自己對非插件片段放在這行之後

"""""""""""""""""""""""""
"    YouCompleteMe      "
"""""""""""""""""""""""""
" YouCompleteMe配置
" 配置默认文件路径
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
" 打开vim时，不再询问是否加载ycm_extra_conf.py配置
let g:ycm_confirm_extra_conf = 0
" 跳转快捷键
nnoremap <C-k> :YcmCompleter GoToDeclaration<CR>|
nnoremap <C-h> :YcmCompleter GoToDefinition<CR>|
nnoremap <C-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>|
nnoremap <C-l> :YcmCompleter GoToReferences<CR>
" 让补全的行为和IDE一致
set completeopt=longest,menu
"自动开启语义补全
let g:ycm_seed_identifiers_with_syntax = 1
"在注释中也开启补全
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"字符串中也开启补全
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
"开启基于tag的补全，可以在这之后添加需要的标签路径
let g:ycm_collect_identifiers_from_tags_files = 1
"开始补全的字符数
let g:ycm_min_num_of_chars_for_completion = 2
"补全后自动关闭预览窗口
let g:ycm_autoclose_preview_window_after_completion = 1
"移动光标时关闭预览窗口
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"整合UltiSnips的提示
let g:ycm_use_ultisnips_completer = 1
"在实现和声明之间跳转时，分屏打开
let g:ycm_goto_buffer_command = 'horizontal-split'
"错误表示符
let g:ycm_error_symbol='>>'
"警告表示符
let g:ycm_warningsymbol='>*'

""""""""""""""""""""""""""""""""""""""""""
" => markdown 
"""""""""""""""""""""""""""""""""""""""""
" let g:instant_markdown_browser = "chrome --new-window"

""""""""""""""""""""""""""""""""""""""""""
" => go 
""""""""""""""""""""""""""""""""""""""""""
let g:godef_same_file_in_same_window=1 "函数在同一个文件中时，不需要打开新窗口
""""""""""""""""""""""""""""""""""""""""""
" => NREDTree
""""""""""""""""""""""""""""""""""""""""""
" 打开文件时自动打开NREDTree
autocmd vimenter * NERDTree
