augroup qf_nofile_prefix
    autocmd!
    autocmd BufReadPost quickfix  setlocal modifiable
                \ | silent exe 'g/^/s/\v^[^|]*\|[^|]*\| / /'
                \ | setlocal nomodifiable
augroup END
