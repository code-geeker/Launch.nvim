" ~/.config/nvim/after/indent/cfm.vim
" Enhanced CFML indentation for Vim/Neovim
setlocal indentexpr=GetCfmIndent()
setlocal indentkeys=0{,0},:,0),0],0>,0<,=end,=else,=elseif,=case,=defaultcase
setlocal autoindent
setlocal smartindent

function! GetCfmIndent()
  let prev_lnum = prevnonblank(v:lnum - 1)
  if prev_lnum == 0
    return 0
  endif

  let prev_line = getline(prev_lnum)
  let current_line = getline(v:lnum)
  let prev_indent = indent(prev_lnum)
  let shiftwidth = &shiftwidth

  " Current line patterns
  let closing_tag = current_line =~? '^\s*</'
  let cfelse_tag = current_line =~? '^\s*<cfelse\>'
  let cfelseif_tag = current_line =~? '^\s*<cfelseif\>'
  let cfcase_tag = current_line =~? '^\s*<cfcase\>'
  let cfdefaultcase_tag = current_line =~? '^\s*<cfdefaultcase\>'
  let cfscript_tag = current_line =~? '^\s*<cfscript\>'

  " Previous line patterns
  let opening_tag = prev_line =~? '<\([^/!][^>]*\)>'
  let cfif_tag = prev_line =~? '<cfif\>'
  let cfloop_tag = prev_line =~? '<cfloop\>'
  let cfoutput_tag = prev_line =~? '<cfoutput\>'
  let cffunction_tag = prev_line =~? '<cffunction\>'
  let cfswitch_tag = prev_line =~? '<cfswitch\>'
  let cftry_tag = prev_line =~? '<cftry\>'
  let cfcatch_tag = prev_line =~? '<cfcatch\>'
  let cfquery_tag = prev_line =~? '<cfquery\>'
  let cfmail_tag = prev_line =~? '<cfmail\>'
  let cfscript_block = prev_line =~? '<cfscript\>.*[^>]$'

  " Current line is closing tag - reduce indent
  if closing_tag
    " Special case for </cfscript> which might be on its own line
    if current_line =~? '</cfscript>'
      return prev_indent
    endif
    return prev_indent - shiftwidth
  endif

  " Handle cfelse/cfelseif - align with corresponding cfif
  if cfelse_tag || cfelseif_tag
    " Find matching cfif
    let if_lnum = searchpair('<cfif\>', '', '</cfif>', 'bnW')
    if if_lnum > 0
      return indent(if_lnum)
    endif
  endif

  " Handle cfcase/cfdefaultcase - indent inside cfswitch
  if cfcase_tag || cfdefaultcase_tag
    " Find matching cfswitch
    let switch_lnum = searchpair('<cfswitch\>', '', '</cfswitch>', 'bnW')
    if switch_lnum > 0
      return indent(switch_lnum) + shiftwidth
    endif
  endif

  " Handle cfscript tag specially
  if cfscript_tag
    return prev_indent
  endif

  " Previous line was an opening tag that should increase indent
  if opening_tag && !(prev_line =~? '<\w\+\s*/>') " Skip self-closing tags
    " Don't increase indent for certain tags
    if !(prev_line =~? '<\(cfelse\|cfelseif\|cfcase\|cfdefaultcase\|cfinclude\|cfset\|cfparam\|cfargument\)\>')
      " Special handling for script blocks
      if cfscript_block
        return prev_indent
      endif
      return prev_indent + shiftwidth
    endif
  endif

  " Handle script blocks (content between <cfscript> and </cfscript>)
  if prev_line =~? '<cfscript>'
    return prev_indent + shiftwidth
  endif

  " Handle closing tags in previous line (for nested structures)
  if prev_line =~? '</\w\+>'
    " Find matching opening tag
    let tag_name = matchstr(prev_line, '</\zs\w\+\ze>')
    let opening_lnum = searchpair('<'.tag_name.'\>', '', '</'.tag_name.'>', 'bnW')
    if opening_lnum > 0
      return indent(opening_lnum)
    endif
  endif

  " Default case - maintain previous indent
  return prev_indent
endfunction
