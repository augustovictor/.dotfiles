fun! Scratch(cmd)
  new
  setlocal nobuflisted buftype=nofile bufhidden=delete

  let output = systemlist(a:cmd)
  call append(call bufnr(), l:output)
endfun
