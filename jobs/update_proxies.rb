require_relative './requires'
logger = CronLogger.new

proxies = "91.188.242.236:9456:ddMK24:1qNPHt
91.188.240.238:9537:ddMK24:1qNPHt
91.188.240.88:9956:ddMK24:1qNPHt
91.188.240.248:9550:ddMK24:1qNPHt
91.188.242.154:9095:ddMK24:1qNPHt
91.188.241.162:9780:ddMK24:1qNPHt
91.188.242.181:9007:ddMK24:1qNPHt
91.188.242.177:9976:ddMK24:1qNPHt
91.188.240.30:9322:ddMK24:1qNPHt
91.188.243.155:9817:ddMK24:1qNPHt
193.31.101.57:9913:ucfxYN:XdQf22
193.31.102.94:9189:ucfxYN:XdQf22
193.31.103.236:9812:ucfxYN:XdQf22
212.81.38.251:9376:ucfxYN:XdQf22
212.81.36.98:9108:ucfxYN:XdQf22
212.81.37.92:9975:ucfxYN:XdQf22
212.81.38.215:9846:ucfxYN:XdQf22
212.81.37.184:9944:TK2M3h:ukh3LY
212.81.39.144:9467:TK2M3h:ukh3LY
212.81.39.164:9816:TK2M3h:ukh3LY
212.81.36.133:9148:TK2M3h:ukh3LY
212.81.39.163:9984:TK2M3h:ukh3LY
212.81.39.231:9875:TK2M3h:ukh3LY
212.81.39.187:9260:TK2M3h:ukh3LY
212.81.36.141:9646:TK2M3h:ukh3LY
212.81.36.210:9966:TK2M3h:ukh3LY
212.81.36.169:9311:TK2M3h:ukh3LY
91.188.242.107:9704:S3ftJe:eeb6wk
138.59.206.59:9623:xNRK6j:1Ea69N
138.59.206.23:9175:xNRK6j:1Ea69N
138.59.206.7:9115:xNRK6j:1Ea69N
138.59.205.238:9615:xNRK6j:1Ea69N
138.59.205.197:9660:xNRK6j:1Ea69N".split("\n")

proxies.each do |proxy_string|
  logger.noise "Updating proxies from file ... "
  proxy = proxy_string.split(":")
  Prox.create(host: proxy[0], port: proxy[1], status: Prox::ONLINE, login: proxy[2], password: proxy[3], provider: "proxy6")
  logger.say("Proxy #{proxy.first}:#{proxy.last} added to proxy pool")
end

Prox::flush
DB.disconnect
logger.noise "Finished."
