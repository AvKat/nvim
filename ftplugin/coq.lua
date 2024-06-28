function create_coq_bind(key, action)
  vim.keymap.set(
    'n',
    string.format("<leader>%s", key),
    string.format("<Plug>%s", action),
    { buffer = true })
end

create_coq_bind("cc", "CoqStart")
create_coq_bind("cq", "CoqStop")
create_coq_bind("cj", "CoqNext")
create_coq_bind("ck", "CoqUndo")
create_coq_bind("cl", "CoqToLine")
