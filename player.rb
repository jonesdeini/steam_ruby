require 'steam-condenser'

class Player

  attr_accessor :steam_profile, :stats, :current_tf2_hours, :total_tf2_hours

  def initialize(id)
    @steam_profile = SteamId.new id
    # @stats = id.game_stats("tf2")
  end

  def get_tf_hours
    games = @steam_profile.games
    games.each do |game_id, game|
      if game.name == "Team Fortress 2"
        playtimes = @steam_profile.playtime
        @current_tf2_hours = playtimes[game_id].first / 60
        @total_tf2_hours = playtimes[game_id].last / 60
      end
    end
  end

end

player = Player.new 76561198015466913
#puts player.steam_profile.total_playtime 440
#puts player.steam_profile.game_stats("tf2").inspect
puts player.steam_profile.inspect
