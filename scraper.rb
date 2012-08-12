require 'net/http'
require 'typhoeus'

class Scraper

attr_accessor :steam_id_list

PLAYER_LIST_REGEX = /http\:\/\/xxlgamers\.gameme\.com\/playerinfo\/(\d+)/
STEAM_ID_REGEX = /http\:\/\/steamcommunity\.com\/profiles\/(\d+)/
PLAYER_INFO = "http://xxlgamers.gameme.com/playerinfo/"

  def initialize(url)
    page = retrieve_source(url)
    playerinfo_id_list = parse_source(page, PLAYER_LIST_REGEX)
    puts "parsed player info ids"
    hydra = Typhoeus::Hydra.new
    steam_idz = []
    id_page = []
    playerinfo_id_list.each_with_index do |id, index|
      id_page[index] = Typhoeus::Request.new(PLAYER_INFO + id.first.to_s)
      id_page[index].on_complete do |response|
        if response.success?
          print "$"
          steam_idz << parse_source(response.body, STEAM_ID_REGEX)
          print "*"
        else
          puts "oh noes!"
        end
      end
      hydra.queue id_page[index]
    end
    hydra.run
    @steam_id_list = steam_idz
    print "\n"
  end

  def retrieve_source(url)
    Net::HTTP.get_response(URI.parse(url)).body
  end

  def parse_source(page, regexp)
    player_info_id = page.scan regexp
    player_info_id.compact.uniq
  end

end
