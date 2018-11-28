# frozen_string_literal: true

class FootballPlayerManager
  attr_reader :player

  def initialize(player)
    @player = player
  end

  def stronger_players
    # TODO: Implement me pls
    Player.where(power: (player.power + 1)..100)
  end

  def set_power(value)
    # TODO: I need body
    player.update(power: value)
    player
  end

  def copy_player
    # TODO: I feel empty inside
    Player.create(captain: player.captain, first_name: player.first_name, last_name: player.last_name, power: player.power)
  end
end
