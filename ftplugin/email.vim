function! MailrSaveDraft()
  let drafts_dir=expand("~/.mailr/drafts")
  if !isdirectory(drafts_dir)
    call system("mkdir -p " . drafts_dir)
  end
  let date=strftime("%Y-%m-%d_%H-%M")
  let draft_path = drafts_dir . "/" . date . ".email"
  exec "saveas! " . draft_path
endfunc


function! MailrSend()
  if input("Send? [yes/no] ") =~ '^\(y\|ye\|yes\)$'
    if bufname('%') == ''
      Draft
    else
      w
    end
    exec "!" . g:mailr_command . " send " . expand('%')
  end
endfunc

function! CompleteContact(findstart, base)
  if a:findstart
    return LocateWordStart()
  else
    if getline('.') =~ '^From:'
      let contacts = system(g:mailr_command . " addresses")
    else
      let contacts = system("grep -h " . a:base . " ~/.mailr/contacts/*.contacts")
    endif
    return split(contacts, "\n", 0)
  end
endfunc

function! LocateWordStart()
  " locate the start of the word
  let line = getline('.')
  let start = col('.') - 1
  while start > 0 && line[start - 1] =~ '\a'
    let start -= 1
  endwhile
  return start
endfunc

command! -buffer Draft call MailrSaveDraft()
command! -buffer Send call MailrSend()

setlocal omnifunc=CompleteContact
