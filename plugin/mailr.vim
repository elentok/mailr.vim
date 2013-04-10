let g:mailr_command=expand("~/projects/mailr/bin/mailr")
let g:mailr_preview="qlmanage -p"

function! MailrCompose()
  new
  setlocal filetype=email
  call setline(1, "From: ")
  call setline(2, "To: ")
  call setline(3, "Subject: ")
  call setline(4, "========================")
  exec "normal ggA "
  startinsert
endfunc

command! Compose call MailrCompose()
