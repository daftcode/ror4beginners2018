module PlayersHelper

  def captain
    @captain = @captains.first
    team_power_add @captain.power
    @captain.first_name
  end

  def captain_id
    @captains.shift.id
  end

  def player
    @player = @players.first
    team_power_add @player.power
    @player.first_name
  end

  def player_id
    @players.shift.id
  end

  def team_power
    @tmp = @team_power
    @team_power = 0
    @tmp
  end

  private
  
  def team_power_add power
    @team_power = @team_power ? @team_power += power : power
  end

end
