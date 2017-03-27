# 要加载此文件,在~/.config/fish/config.fish中添加
# source /path/to/this/file
function brs
    hg branches | grep $argv
end
function _1920
    sudo xrandr --newmode "1920x1080_60.00" 173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
    sudo xrandr --addmode DP2 "1920x1080_60.00"
    sudo xrandr --output DP2 --mode "1920x1080_60.00"
end

set -x POLYSH_DIR /home/cxc/workspace/dotfile/public/polysh
set -x PATH /home/cxc/workspace/dotfile/public/polysh/shell $PATH
set -x PATH /home/cxc/workspace/dotfile/public/shell $PATH
