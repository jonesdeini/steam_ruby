load 'server_list.rb'
load 'tf2_server.rb'
load 'player.rb'
load 'scraper.rb'
load 'bp_search.rb'

# url = "http://xxlgamers.gameme.com/tf"
url = "http://xxlgamers.gameme.com/overview/17"

s = Scraper.new url
puts s.steam_id_list.count
# sleep 10
# puts s.steam_id_list.count
#s.steam_id_list.each do |steam_id|
#  if steam_id.any?
#    bp = Bp_search.new steam_id.first.first
#    if bp.crate_19 
#      puts steam_id
#    end
#  end
#  print "*"
#end
