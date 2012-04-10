require 'net/http'
require 'rexml/document'

class Bp_search

API_CALL = "http://api.steampowered.com/IEconItems_440/GetPlayerItems/v0001/?key=987F12F50781CAE789D03E5A22D704D1&steamid="
API_FORMAT = "&format=xml"
  
  def initialize(steam_id)
    url = API_CALL + steam_id + API_FORMAT
    xml_data = Net::HTTP.get_response(URI.parse(url)).body
    @doc = REXML::Document.new(xml_data)
    parse_xml(@doc, "result/status")
  end

  def parse_xml(xml_doc, element)

  end

end
