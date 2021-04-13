setlocal indentexpr=FrrIndent()

function! FrrIndent()
  let line = getline(v:lnum)
  let previousNum = v:lnum - 1
  let previous = getline(previousNum)

" Don't change comments
if previous =~ "^!"
  return
endif

" Don't change empty lines
if previous =~ "^$"
  return
endif

let b:res = "false"
let config_keyword_list=[ "access-list", "agentx", "allow-external-route-update", "banner", "bfd", "bgp", "debug", "domainname", "dump", "enable", "end", "evpn", "exit", "find", "fpm", "frr", "hostname", "i[nterface]", "ip", "ipv6", "key", "l2vpn", "line", "list", "log", "mac", "mpls", "nexthop-group", "no", "output", "password", "pbr", "pbr-map", "pseudowire", "quit", "route-map", "r[outer]", "router-id", "rpki", "segment-routing", "service", "terminal", "username", "vni", "vrf", "vrrp", "zebra" ]
for kword in config_keyword_list
  let kregexp="^".kword
  if previous =~ kregexp
    let b:res = "true"
    continue
  endif
endfor

  if b:res=="true"
    return indent(previousNum) + &tabstop
  else
    return indent(previousNum)
  endif
endfunction
