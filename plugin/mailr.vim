let g:mailr_command=expand("~/projects/mailr/bin/mailr")

function! MailrCompose()
  new
  setlocal filetype=email
  call setline(1, "From: ")
  call setline(2, "To: ")
  call setline(3, "Subject: ")
  call setline(4, "========================")
endfunc

command! Compose call MailrCompose()
