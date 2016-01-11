# How to install

Manually:
```
git clone git@github.com:simeng/vim-imba.git
mkdir -p ~/.vim/syntax
cp vim-imba/syntax/imba.vim ~/.vim/syntax
echo 'au! BufNewFile,BufRead *.imba set filetype=imba' >> ~/.vimrc
```

or using your favourite plugin manager:
```
Bundle 'simeng/vim-imba'
Plugin 'simeng/vim-imba'
Plug 'simeng/vim-imba'
```
