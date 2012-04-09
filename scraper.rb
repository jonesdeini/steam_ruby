require 'net/http'

class Scraper

PLAYER_INFO = "http://xxlgamers.gameme.com/playerinfo/"

attr_accessor :player_list, :player_info_id

  def initialize(url)
    page = Net::HTTP.get_response(URI.parse(url)).body
    @player_list = parse_player_info_ids(page)
  end

  def parse_player_info_ids(page)
    regexp = /http\:\/\/xxlgamers\.gameme\.com\/playerinfo\/(\d+)/
    regexp =~ page
    #return array of playerinfoids
  end

end
