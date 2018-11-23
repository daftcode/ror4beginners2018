module TeamHelper
  
  def create_teams(captains, players, teams_num = 2)
    teams = Array.new
      (0...teams_num).each do |_|
        teams += [players.shift(10).unshift(captains.pop)]
      end
      return teams
  end

end
