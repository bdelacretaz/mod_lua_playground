# Map incoming requests to mod_proxy
function remap(r)
  math.randomseed(os.time())
  id = math.random(1, 5)
  r.handler = "proxy-server"
  r.proxyreq = apache2.PROXYREQ_REVERSE
  r.filename = "proxy:http://api.icndb.com/jokes/" .. id
  return apache2.OK
end
