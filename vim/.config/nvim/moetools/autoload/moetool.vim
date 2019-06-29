" 复制当前行到 system clipboard
" action like ^"+yg_ but without moving cursor
function! moetool#YankOneLine()
    let @+=trim(getline('.'))
    echo "[moetool#YankOneLine] to system clipboard"
endfunction


" 切换鼠标开关
function! moetool#ToggleMouse()
    if &mouse ==# ""
        set mouse=a
        echo "[moetool#ToggleMouse] enable mouse"
    else
        set mouse=""
        echo "[moetool#ToggleMouse] disable mouse"
    endif
endfunction

