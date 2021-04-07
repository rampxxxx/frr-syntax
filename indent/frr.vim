setlocal indentexpr=FrrIndent()

function! FrrIndent()
  let line = getline(v:lnum)
  let previousNum = prevnonblank(v:lnum - 1)
  let previous = getline(previousNum)

  if previous =~ "interface" || previous =~ "router"
    return indent(previousNum) + &tabstop
  endif

endfunction
