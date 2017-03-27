#/bin/bash
# init vim envirment for new vim
# detected autoload dir exists

function install()
{
    baseDir="/home/cxc/.vim/bundle/"
    name=$1
    gitUrl=$2
    if [ ! -d $baseDir$name ]; then
        echo "开始安装插件 "{$name}
        cd $baseDir && git clone $gitUrl $name
        status=$? 
        if [ ! $status -eq 0 ]; then
            echo "安装 "{$name}" 失败 "{$status}
        fi
    else
        echo "插件 "{$name}" 已经安装了, 跳过.."
    fi
}

if [ ! -d ~/.vim/autoload ]; then
    echo "创建 autoload 文件夹"
    mkdir -p ~/.vim/autoload
else
    echo "文件夹 autoload 已经存在了,跳过..."
fi

if [ ! -f ~/.vim/autoload/pathogen.vim ]; then
    echo "安装 pathogen"
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
else
    echo "pathoten 已经安装了"
fi

if [ ! -d ~/.vim/bundle ]; then
    echo "创建 bundle 文件夹"
    mkdir -p ~/.vim/bundle
else
    echo "文件夹 bundle 已经存在了, 跳过"
fi

install minibufexpl.vim git@github.com:fholgado/minibufexpl.vim.git
install ctrlp.vim https://github.com/kien/ctrlp.vim.git
install nerdtree https://github.com/scrooloose/nerdtree.git
install vim-easy-align https://github.com/junegunn/vim-easy-align.git
install tagbar https://github.com/majutsushi/tagbar.git
install DoxygenToolkit.vim git@github.com:vim-scripts/DoxygenToolkit.vim.git
install easymotion git@github.com:easymotion/vim-easymotion.git
install gitgutter git@github.com:airblade/vim-gitgutter.git
#install airline git@github.com:vim-airline/vim-airline.git
install powerline git@github.com:powerline/powerline.git

if [ ! -f ~/.vimrc ]; then
    echo "自动安装 ~/.vimrc"
    cp vimrc ~/.vimrc
else
    echo "~/.vimrc 文件已经存在了"
    currentMd5=`md5sum ~/.vimrc | awk '{print $1}'`
    stableMd5=`md5sum ./vimrc | awk '{print $1}'`
    if [ $currentMd5 == $stableMd5 ]; then
        echo "~/.vimrc文件与版本库文件相同，跳过.."
    else
        type meld
        if [ $? -eq 0 ]; then
            echo 已选择meld作为比较工具
            cmd=meld
        else
            type vimdiff
            if [ $? -eq 0 ]; then
                cmd=vimdiff
                echo 已选择vimdiff作为比较工具
            else
                echo "未安装diff工具，请安装meld或者vimdiff"
            fi
        fi
        if [ $cmd ]; then
            echo "3秒后开始比较vimrc文件差异, 准备.."
            sleep 1
            echo "3"
            sleep 1
            echo "2"
            sleep 1
            echo "1"
            $cmd ~/.vimrc ./vimrc
            if [ $? -gt 0 ]; then
                echo 比较差异遇到问题，请重试
            else
                echo "差异比较完毕"
            fi
        fi
    fi
fi
echo "vim环境初始化完毕"
