<!-- vim-markdown-toc GFM -->

* [一、安装vundle](#一安装vundle)
* [二、安装YouCompleteMe](#二安装youcompleteme)
* [三、安装`vim-go`](#三安装vim-go)
* [四、安装`isRuslan/vim-es6`](#四安装isruslanvim-es6)
* [五、安装`vim-jsdoc`](#五安装vim-jsdoc)
* [六、安装`tern-for-vim`](#六安装tern-for-vim)
* [七、安装`vim-markdown`](#七安装vim-markdown)
* [八、安装`vim-markdown-toc`](#八安装vim-markdown-toc)
* [九、安装`vim-instant-markdown`](#九安装vim-instant-markdown)
* [十、自动补全括号的插件`jiangmiao/auto-pairs`](#十自动补全括号的插件jiangmiaoauto-pairs)
* [十一、`tab`补全插件](#十一tab补全插件)
* [十二、`go`跳转插件`godef`](#十二go跳转插件godef)
* [十三、`NERDTree`的安装](#十三nerdtree的安装)
* [十四、`LeaderF`的安装](#十四leaderf的安装)
* [十五、`tagbar`的安装](#十五tagbar的安装)

<!-- vim-markdown-toc -->

### 一、安装vundle

- 下载vundle

````shell
git clone https://github.com/gmarik/vundle.git  ~/.vim/bundle/Vundle.vim
````

- 打开`vimrc`
```shell
vim ~/.vimrc
```

- 配置`vimrc`
```shell
set nocompatible " 去除vi的一致性，必须
filetype off " 必须

" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 另一種選擇, 指定一個vundle安裝插件的路徑
"call vundle#begin('~/some/path/here')

" 讓vundle管理插件版本,必須
Plugin 'VundleVim/Vundle.vim'

" 以下範例用來支持不同格式的插件安裝.
" 請將安裝插件的命令放在vundle#begin和vundle#end之間.
" Github上的插件
" 格式為 Plugin '用戶名/插件倉庫名'
" Plugin 'tpope/vim-fugitive'
" 來自 http://vim-scripts.org/vim/scripts.html 的插件
" Plugin '插件名稱' 實際上是 Plugin 'vim-scripts/插件倉庫名' 只是此處的用戶名可以省略
" Plugin 'L9'
" 由Git支持但不再github上的插件倉庫 Plugin 'git clone 後面的地址'
" Plugin 'git://git.wincent.com/command-t.git'
" 本地的Git倉庫(例如自己的插件) Plugin 'file:///+本地插件倉庫絕對路徑'
" Plugin 'file:///home/gmarik/path/to/plugin'
" 插件在倉庫的子目錄中.
" 正確指定路徑用以設置runtimepath. 以下範例插件在sparkup/vim目錄下
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" 安裝L9，如果已經安裝過這個插件，可利用以下格式避免命名衝突
" Plugin 'ascenator/L9', {'name': 'newL9'}

" 你的所有插件需要在下面這行之前
call vundle#end()            " 必須
" filetype plugin indent on    " 必須 加載vim自帶和插件相應的語法和文件類型相關腳本
" 忽視插件改變縮進,可以使用以下替代:
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
```

- 执行`:PluginInstall`


### 二、安装YouCompleteMe

- 下载
	
	- 通过插件管理安装`YouConpleteMe`:
	
		- 在`~/.vimrc`中添加一行
		```shell
		call vundle#begin()
		...
		Plugin 'Valloric/YouCompleteMe'
		...
		call vundle#end()
		```
	
		- 然后保存，运行命令`:PluginInstall`
	
	- 通过`git`安装
		- 下载：
		```shell
		git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
		```

- 进入下载目录
```shell
cd ~/.vim/vundle/YouCompleteMe
```

- 进行编译
```shell
python3 install.py --clang-completer --clangd-completer --go-completer --ts-completer
```

- 将插件放入`~/.vimrc`
```shell
call vundle#begin()
...
Plugin 'Valloric/YouCompleteMe'
...
call vundle#end()
```


### 三、安装`vim-go`
- `~/.vimrc`下添加：
```shell
Plugin 'fatih/vim-go'
```
- 然后执行：
```shell
:PluginInstall
```
- 然后执行：
```shell
:GoInstallBinaries
```
**注意**：由于某些原因，安装`go`工具会失败，这是可以为`go`设置代理：
```shell
export GO111MODULE=on
export goproxy=https://goproxy.org
```

### 四、安装`isRuslan/vim-es6`
```shell
Plugin 'isRuslan/vim-es6'
```


### 五、安装`vim-jsdoc`
```shell
Plugin 'heavenshell/vim-jsdoc'
```


### 六、安装`tern-for-vim`
```shell
Plugin 'marijnh/tern_for_vim'
```
- 需要配合`YouCompleteMe`使用
```shell
python3 install.py --tern-completer
```
- 进入`tern_for_vim`
```shell
cs ~/.vim/bundle/tern_for_vim
```
- 执行包安装命令
```shell
npm install
```
- 在`~`目录或者项目根目录下创建`.tern-project`，输入以下配置：
```shell
{
    "ecmaVersion": 6,
    "libs": [
    ],
    "plugins": {
        "node": {}
    }
}
```


### 七、安装`vim-markdown`
`markdown`高亮工具
```shell
Plugin 'plasticboy/vim-markdown'
```


### 八、安装`vim-markdown-toc`
用于生成`markdown` 标题
```shell
Plugin mzlogin/vim-markdown-toc
```
生成`GFM`风格的文章目录
```shell
:GenTocGFM
```
生成`Redcarpet`链接风格的文章目录
```shell
:GenTocRedcarpet
```

### 九、安装`vim-instant-markdown`
用于预览`markdown`
```shell
npm -g install instant-markdown
```
安装插件
```shell
Plugin 'suan/vim-instant-markdown', {'rtp': 'after'}
```


### 十、自动补全括号的插件`jiangmiao/auto-pairs`
```shell
Plugin 'jiangmiao/auto-paris'
```


### 十一、`tab`补全插件
```shell
Plugin 'vim-script/SuperTab'
```


### 十二、`go`跳转插件`godef`
- 安装插件：
```shell
Plugin 'rogpeppe/godef'
```
- 设置快捷键：
```shell
autocmd Filetype go nnoremap <buffer> gd :call GodefUnderCursor()<cr>
autocmd Filetype go nnoremap <buffer> <C-]> :call GodefUnderCursor()<cr>
```
### 十三、`NERDTree`的安装
```shell
Plugin 'scrooloose/nerdtree'
```
### 十四、`LeaderF`的安装
该插件需要Python的支持
```shell
Plugin 'Yggdroot/LeaderF'
```
安装完成后执行`:LeaderfFile`即可进行文件搜索
### 十五、`tagbar`的安装
```shel
Plugin 'majutsushi/tagbar'
```
该插件需要`ctags`的支持
```shell
# ubuntu
sudo apt-get install ctags
# centos
sudo yum install ctags
# mac
brew install ctags
```
最后在`.vimrc`设置使用的`ctags`插件位置，必须要设置对，如：
```shell
let g:tagbar_ctags_bin='/usr/bin/ctags'
```
