# frozen_string_literal: true

class FootballPlayerManager
  attr_reader :player

  def initialize(player)
    @player = player
  end

  def stronger_players
    Player.where("power > ?", @player[:power])
  end

  def set_power(value)
    @player.update(power: value)
  end

  def copy_player
    clone = @player.dup
    clone if clone.save
  end
end