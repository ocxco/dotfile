#/bin/bash
# init vim envirment for new vim
# detected autoload dir exists
function install()
{
    baseDir="/home/cxc/.vim/bundle/"
    name=$1
    gitUrl=$2
    if [ ! -d $baseDir$name ]; then
        cd $baseDir && git clone $gitUrl $name
        status=$? 
        if [ ! $status -eq 0 ]; then
            echo "install "{$name}" error "{$status}
        fi
    else
        echo "plugin "{$name}" already installed"
    fi
}

if [ ! -d ~/.vim/autoload ]; then
    echo "create autoload dir"
    mkdir -p ~/.vim/autoload
else
    echo "autoload dir already exists"
fi

if [ ! -f ~/.vim/autoload/pathogen.vim ]; then
    echo "install pathogen"
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
else
    echo "pathoten already installed"
fi

if [ ! -d ~/.vim/bundle ]; then
    echo "create bundle dir"
    mkdir -p ~/.vim/bundle
else
    echo "bundle dir already exists"
fi

install minibufexpl.vim git@github.com:fholgado/minibufexpl.vim.git
install ctrlp.vim https://github.com/kien/ctrlp.vim.git
install nerdtree https://github.com/scrooloose/nerdtree.git
install vim-easy-align https://github.com/junegunn/vim-easy-align.git
install tagbar https://github.com/majutsushi/tagbar.git
