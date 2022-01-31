(function()
  vim.api.nvim_exec(
    [[
    augroup illuminate_augroup
      autocmd!
      autocmd VimEnter * hi illuminatedWord cterm=underline gui=underline
    augroup END
    ]],
    false
  )
end)("RRethy/vim-illuminate")
