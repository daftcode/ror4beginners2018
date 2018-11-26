class Character
  attr_accessor :name
  attr_accessor :level

  def initialize(name: nil, level: 1)
    self.name = name
    if level > 0 && level < 100
      self.level = level
    else
      self.level = 1
    end
  end

  def strength
    return level + [*1..12].sample
  end

  def card
    return "#{name} (lvl #{level})"
  end

end

class Warrior < Character

end

class Monster < Character

end

class BattleArena
  attr_accessor :first_character
  attr_accessor :second_character

  def initialize(first_character, second_character)
    self.first_character = first_character
    self.second_character = second_character
  end

  def battle!
    first_strength = self.first_character.strength
    second_strength = self.second_character.strength

    print_action(self.first_character, self.second_character, first_strength)
    print_action(self.second_character, self.first_character, second_strength)

    if first_strength > second_strength
      winner = self.first_character
      puts "#{winner.name} won"
      upgrade_winner(winner, self.second_character.level - self.first_character.level)
    elsif first_strength < second_strength
      winner = self.second_character
      puts "#{winner.name} won"
      upgrade_winner(winner, self.first_character.level - self.second_character.level)
    else
      puts "Tie"

    end

    end

  def print_action(first_character, second_character, strength)
    puts "#{first_character.name} attacked #{second_character.name} with #{strength} damage"
  end

  def upgrade_winner(winner, lvl_diff)
    if winner.is_a? Warrior
      lvl_diff >= 0 ? level = winner.level + lvl_diff + 1 : level = winner.level
      level > 99 ? winner.level = 99 : winner.level = level
    end
  end

end