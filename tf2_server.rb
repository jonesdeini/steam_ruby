class TF2_Server

  attr_accessor :server

  def initialize(ip)
    @server = GoldSrcServer.new(ip.first, ip.last.to_i)
    @server.init
  end

  def players
    @server.players
  end

end
