require 'steam-condenser'
load 'server_list.rb'
load 'tf2_server.rb'
load 'player.rb'
load 'scraper.rb'
load 'bp_search.rb'

url = "http://xxlgamers.gameme.com/tf"

s = Scraper.new url
puts "parsed steam ids"
puts s.steam_id_list.inspect
s.steam_id_list.each do |steam_id|
  if steam_id.any?
    bp = Bp_search.new steam_id.first.first
    if bp.crate_19 
      puts steam_id
    end
  end
  print "*"
end
