if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal indentexpr=ImbaIndent(v:lnum)
setlocal indentkeys+=<:>,=elif,=except

if exists("*ImbaIndent")
  finish
endif

function ImbaIndent(lnum)
  let plnum = prevnonblank(v:lnum - 1)

  let pline = getline(plnum)
  let plindent = indent(plnum)

  " Indent tag and function content
  if pline =~ '^.*\<\(def\|tag\)\>'
      return plindent + shiftwidth()
  endif

  return -1

endfunction

