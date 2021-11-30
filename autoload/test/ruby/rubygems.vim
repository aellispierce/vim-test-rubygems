function! test#ruby#rubygems#test_file(file) abort
  return expand('%:p') =~# 'rubygems/'
endfunction

function! test#ruby#rubygems#build_position(type, position) abort
  if a:type ==# 'nearest'
    let name = s:nearest_test(a:position)
    if !empty(name)
      return [a:position['file'], '--name', '/'.name.'/']
    else
      return [a:position['file']]
    endif
  elseif a:type ==# 'file'
    return [a:position['file']]
  else
    return []
  endif
endfunction

function! test#ruby#rubygems#build_args(args) abort
  return [get(l:, 'path')] + a:args
endfunction

function! test#ruby#rubygems#executable() abort
  return 'ruby -Ilib:test:bundler/lib'
endfunction

function! s:nearest_test(position) abort
  let name = test#base#nearest_test(a:position, g:test#ruby#patterns)

  if empty(name['test'])
    let test = ''
  else
    let test = name['test'][0]
  endif

  return escape(test, '"')
endfunction

