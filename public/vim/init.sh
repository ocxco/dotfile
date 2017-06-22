#/bin/bash
# init vim envirment for new vim
# detected autoload dir exists

function install()
{
    baseDir=~/.vim/bundle/
    name=$1
    gitUrl=$2
    if [ ! -d $baseDir$name ]; then
        echo -e "\033[32m 开始安装插件 \033[35m"{$name}"\033[0m"
        cd $baseDir && git clone $gitUrl $name
        status=$? 
        if [ ! $status -eq 0 ]; then
            echo -e "\033[31m 安装 \033[35m "{$name}"\033[31m 失败 "{$status}"\033[0m"
        fi
    else
        echo -e "\033[33m 插件\033[35m "{$name}"\033[33m 已经安装了, 跳过..\033[0m"
    fi
}

if [ ! -d ~/.vim/autoload ]; then
    echo -e "\033[32m 创建 autoload 文件夹\033[0m"
    mkdir -p ~/.vim/autoload
else
    echo -e "\033[33m 文件夹 autoload 已经存在了,跳过...\033[0m"
fi

if [ ! -f ~/.vim/autoload/pathogen.vim ]; then
    echo -e "\033[32m 安装 pathogen\033[0m"
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
else
    echo -e "\033[33m pathoten 已经安装了\033[0m"
fi

if [ ! -d ~/.vim/bundle ]; then
    echo -e "\033[33m 创建 bundle 文件夹\033[0m"
    mkdir -p ~/.vim/bundle
else
    echo -e "\033[33m 文件夹 bundle 已经存在了, 跳过\033[0m"
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
    echo -e "\033[32m 自动安装 ~/.vimrc\033[0m"
    cp vimrc ~/.vimrc
else
    echo -e "\033[33m ~/.vimrc 文件已经存在了\033[0m"
    currentMd5=`md5sum ~/.vimrc | awk '{print $1}'`
    stableMd5=`md5sum ./vimrc | awk '{print $1}'`
    if [ $currentMd5 == $stableMd5 ]; then
        echo -e "\033[33m ~/.vimrc文件与版本库文件相同，跳过..\033[0m"
    else
        type meld
        if [ $? -eq 0 ]; then
            echo -e "\033[32m 已选择meld作为比较工具\033[0m"
            cmd=meld
        else
            type vimdiff
            if [ $? -eq 0 ]; then
                cmd=vimdiff
                echo -e "\033[32m 已选择vimdiff作为比较工具\033[0m"
            else
                echo -e "\033[31m 未安装diff工具，请安装meld或者vimdiff\033[0m"
            fi
        fi
        if [ $cmd ]; then
            echo -e "\033[33m 3秒后开始比较vimrc文件差异, 准备..\033[0m"
            sleep 1
            echo -e "\033[33m3\033[0m"
            sleep 1
            echo -e "\033[33m2\033[0m"
            sleep 1
            echo -e "\033[33m1\033[0m"
            $cmd ~/.vimrc ./vimrc
            if [ $? -gt 0 ]; then
                echo -e "\033[31m 比较差异遇到问题，请重试\033[0m"
            else
                echo -e "\033[032m 差异比较完毕\033[0m"
            fi
        fi
    fi
fi
echo -e "\033[32m vim环境初始化完毕\033[0m"
