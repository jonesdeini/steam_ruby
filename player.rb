class Player

  attr_accessor :steam_id, :stats, :current_tf2_hours, :total_tf2_hours

  def initialize(id)
    @steam_id = SteamId.new(id)
    @stats = id.game_stats("tf2")
    get_tf_hours
  end

  def steam_id
    @steam_id.instance_variable_get :@steam_id64
  end

  def get_tf_hours
    games = @steam_id.instance_variable_get :@games 
    games.each do |game_id, game|
      name = game.instance_variable_get :@name
      if name == "Team Fortress 2"
        playtimes = @steam_id.instance_variable_get :@playtime
        @current_tf2_hours = playtimes[game_id].first / 60
        @total_tf2_hours = playtimes[game_id].last / 60
      end
    end
  end

end
