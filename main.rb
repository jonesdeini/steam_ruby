require 'steam-condenser'
load 'server_list.rb'
load 'tf2_server.rb'

s = TF2_Server.new(SERVERS.first.split(":"))
puts s.players.inspect
