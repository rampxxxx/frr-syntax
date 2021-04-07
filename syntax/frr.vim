" Match TODO comments
syntax keyword frrTodos TODO XXX FIXME NOTE
syntax match frrComment "\v!.*$"
syntax match frrIpv4 "\v<\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}>"
syntax match frrPrefixIpv4 "frrIpv4/<\d>"

" Match language specific keywords
syntax keyword frrKeywords
      \ interface
      \ shutdown
      \ ip
      \ address
      \ peer
      \ multicast
      \ bandwith
      \ link-detect

highlight default link frrTodos Todo
highlight default link frrComment Comment
highlight default link frrKeywords Keyword
highlight default link frrIpv4 Number
highlight default link frrPrefixIpv4 Number


