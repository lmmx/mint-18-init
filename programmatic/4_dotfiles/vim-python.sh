mkdir -p ~/.vim/after/ftplugin

PY_VIM=~/.vim/after/ftplugin/python.vim

echo "setlocal expandtab" >> $PY_VIM
echo "setlocal shiftwidth=4" >> $PY_VIM
echo "setlocal softtabstop=4" >> $PY_VIM
