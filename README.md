# autoim.vim
## 功能
实现 Vim 中文输入时，在 normal mode 与 insert mode 之间切换时中英文输入法的自动切换。具体地：
- Insert mode 下处于中文输入法时，按 Esc 键，会进入 normal mode, 并将输入法切换到英文状态。重新回到 normal mode 时，会自动恢复到中文输入法。
- Insert mode 下处于英文输入法时，按 Esc 键，会进入 normal mode, 并且输入法状态保持不变。重新回到 normla mode 时，仍然是英文输入法。
## 安装
### 使用 Vim-Plug 插件
在你的配置文件中（通常是 .vimrc ）加入如下代码片段
```
call plug#begin()
Plug lipingcoding/autoim.vim
call plug#end()
```


## 使用
在你的配置文件中（通常是 .vimrc ）加入类似如下代码片段
```
let g:autoim_toggle_shortcut = 'cmd_space'
```
本插件的原理是通过 Applescript *模拟切换输入法的快捷键*，所以上面的代码假设你的电脑切换输入法的快捷键是 cmd-space, 如果你的快捷键是 ctrl-space, 那就应该是：
```
let g:autoim_toggle_shortcut = 'ctrl_space'
```

## 具有类似功能的插件
- [smartim](https://github.com/ybian/smartim)
我在使用的过程中，从英文输入法自动切换回中文输入法时，虽然输入法状态是中文，但仍然无法输出中文
- [vim-xkbswitch](https://github.com/lyokha/vim-xkbswitch)
需要调用 objective-c 编写的动态库，在最新的 MacOs 中，由于系统安全性，会报签名认证错误

## 感谢
思路来源于[涛叔的博客](https://taoshu.in/vim/vim-auto-im.html)。
