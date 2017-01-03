# 要加载此文件,在~/.config/fish/config.fish中添加
# source /path/to/this/file
function brs
    hg branches | grep $argv
end

set -x POLYSH_DIR /home/cxc/workspace/dotfile/public/polysh
set -x PATH /home/cxc/workspace/dotfile/public/polysh/shell $PATH
set -x PATH /home/cxc/workspace/dotfile/public/shell $PATH
