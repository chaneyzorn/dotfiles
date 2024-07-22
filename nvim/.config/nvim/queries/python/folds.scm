;; extends

[
  ((block) @if_body
    (#has-parent? @if_body if_statement))
  (elif_clause)
  (else_clause)
  ((block) @try_body
    (#has-parent? @try_body try_statement))
  (except_clause)
  (finally_clause)
] @fold
