require 'steam-condenser'
load 'server_list.rb'
load 'tf2_server.rb'
load 'player.rb'
load 'scraper.rb'


#s = TF2_Server.new(SERVERS.last.split(":"))
#s.players.each do |player|
#  p = Player.new(player.first)
#  puts "current:#{p.current_tf2_hours} / total:#{p.total_tf2_hours}"
#end
#

url = "http://xxlgamers.gameme.com/overview/17"

s = Scraper.new(url)
puts s.player_list.inspect



