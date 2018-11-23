class TeamController < ApplicationController

  include TeamHelper

  def show
    players = Array.new
    captains = Array.new
    
    Player.all.shuffle.each do |player|
      if player.captain
        captains.push player
      else 
        players.push player
      end
    end

    @teams = create_teams(captains, players)    

  end

end
