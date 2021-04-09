setlocal indentexpr=FrrIndent()

function! FrrIndent()
  let line = getline(v:lnum)
  let previousNum = prevnonblank(v:lnum - 1)
  let previous = getline(previousNum)

" Don't change comments
if line =~ "^!"
  return
endif

let b:res = "false"
let klist=["interface","router"]
for kword in klist
  let kregexp="^".kword
  if previous =~ kregexp
    let b:res = "true"
  endif
endfor

  if b:res=="true"
    return indent(previousNum) + &tabstop
  else
    return indent(previousNum)
  endif
endfunction
