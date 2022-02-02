local M = {}

function M.pre()
  local vg = vim.g

  vg.ale_enabled = 0
  vg.ale_disable_lsp = 1
  vg.ale_set_highlights = 0
  vg.ale_echo_msg_format = "%severity% ⏽ %linter% ⏽ %code% ⏽ %s"

  vg.ale_sign_column_always = 1
  vg.ale_sign_error = ""
  vg.ale_sign_warning = ""
  vg.ale_sign_info = ""
  vg.ale_echo_msg_error_str = ""
  vg.ale_echo_msg_warning_str = ""
  vg.ale_echo_msg_info_str = ""

  vg.ale_completion_delay = 500
  vg.ale_echo_delay = 20
  vg.ale_lint_delay = 500
  vg.ale_lint_on_text_changed = "normal"
  vg.ale_lint_on_insert_leave = 1

  -- compile_commands.json still not work well with clang easily
  -- see https://github.com/w0rp/ale/issues/1163#issuecomment-352585720
  vg.ale_c_build_dir_names = { "build", "debug", "bin" }
  vg.ale_c_parse_compile_commands = 1

  -- see https://github.com/MaskRay/ccls/wiki/Customization
  vg.ale_c_ccls_init_options = { cacheDirectory = "~/.cache/ccls" }

  -- 未明确指定 linter 的依然会使用全部可能的linter
  -- 除非 vg.ale_linters_explicit = 1
  -- 显示指定要使用的 linter
  vg.ale_linters = {
    c = { "clangtidy", "ccls", "cppcheck" },
    cpp = { "clangtidy", "ccls", "cppcheck" },
    go = { "golangci-lint" },
    javascript = { "eslint" },
  }

  -- 使用全局 pylint，这样可以使用 venv 中对应版本的 pylint
  vg.ale_python_pylint_use_global = 1
  vg.ale_python_pylint_auto_pipenv = 1
  vg.ale_python_pylint_options = "--rcfile ~/.config/pylintrc"

  vg.ale_go_golangci_lint_options = "--enable-all --disable wsl --disalbe gofumpt"
end

function M.post() end

return M
