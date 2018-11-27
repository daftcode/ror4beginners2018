class PlayersController < ApplicationController

  @captains
  @players

  def index
    setup
    @id = params[:id]
    @stronger = params[:stronger]
    @id ? show_player : teams
  end

  private 

  def teams
    @captains = @@captains.clone
    @players =   @@players.clone
    @team_size = 11;
    @teams = Player.all.count / @team_size;
    
  end

  def show_player
    @player = Player.find(@id)
    stronger_players if @stronger
  end

  def stronger_players
    @stronger_players = FootballPlayerManager.new(@player).stronger_players.to_a.sort_by(&:power).reverse
  end

  def setup
    @@captains = @@players = nil if params[:shuffle]
    @@captains ||= Player.where(captain: true).shuffle
    @@players ||= Player.where(captain: false).shuffle
  end

end