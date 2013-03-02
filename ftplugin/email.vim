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
    end
    exec "!" . g:mailr_command . " send " . expand('%')
  end
endfunc

command! -buffer Draft call MailrSaveDraft()
command! -buffer Send call MailrSend()
