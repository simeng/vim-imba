" vim: sw=2

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

  " Indent if previous line matches this
  if pline =~ '^.*\<\(def\|tag\|class\|if\|else\|elif\|for\|while\|until\|switch\|case\|try\|catch\|finally\)\>'
    return plindent + shiftwidth()
  endif

  " Deintent current line if it matches this
  if getline(v:lnum) =~ '^\s*\(catch\|finally\|else\|elif\|when\)\>'
    return indent(v:lnum) - shiftwidth()
  endif

  " Deintent line after return
  if pline =~ '^\s*return\>'
    return plindent - shiftwidth()
  endif

  " Deintet if second empty line
  if getline(v:lnum - 1) =~ '^\s*$' && getline(v:lnum - 2) =~ '^\s*$'
    return plindent - shiftwidth()
  endif

  return -1

endfunction

