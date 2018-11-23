# frozen_string_literal: true

class FootballPlayerManager
  attr_reader :player

  def initialize(player)
    @player = player
  end

  def stronger_players
    Player.where('power > ?', player.power)
  end

  def set_power(value)
    Player.update(player.id, power: value)
  end

  def copy_player
    player_cp = @player.clone # or should we use dup?
    if player_cp.save
      player_cp
    else 
      puts "error during copy"
      nil
    end
  end
end
