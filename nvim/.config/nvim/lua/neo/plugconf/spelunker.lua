local M = {}

function M.pre()
  local vg = vim.g

  vg.enable_spelunker_vim = 0
  vg.enable_spelunker_vim_on_readonly = 0
  vg.spelunker_target_min_char_len = 3
  vg.spelunker_max_hi_words_each_buf = 500
  vg.spelunker_check_type = 2
  vg.spelunker_disable_uri_checking = 1
  vg.spelunker_disable_email_checking = 1
  vg.spelunker_disable_account_name_checking = 1
  vg.spelunker_disable_acronym_checking = 1
  vg.spelunker_disable_backquoted_checking = 0

  vg.spelunker_spell_bad_group = "SpellBad"
  vg.spelunker_complex_or_compound_word_group = "SpellBad"
end

function M.post() end

function M.keybind() end

return M
