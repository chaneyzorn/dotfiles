let s:neohome = fnameescape(fnamemodify(resolve(expand('<sfile>:p')), ':h'))

execute 'source '.s:neohome.'/vimrc'

