function! mouse#ToggleMouse()
    if &mouse ==# ""
        set mouse=a
        echo "enable mouse"
    else
        set mouse=""
        echo "disable mouse"
    endif
endfunction

