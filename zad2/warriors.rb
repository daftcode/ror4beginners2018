class Character
  attr_accessor :name
  attr_accessor :level

  def initialize(name, level)
    self.name = name
    self.level = (level.is_a? Integer) && level >= 0 && level <= 99 ? level : instance_error
  end

  def strength
    level + [*1..12].sample
  end

  def card
    "#{name} (lvl #{level})"
  end

  def instance_error
    begin
      raise ArgumentError, 'Character can\'t be created'
    rescue
      puts 'Character level should be between 0 and 99'
      exit()
    end
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
    strength1 = first_character.strength
    strength2 = second_character.strength

    puts "#{first_character.name} attacked #{second_character.name} with #{strength1} damage"
    puts "#{second_character.name} attacked #{first_character.name} with #{strength2} damage"

    if (strength1 > strength2)
      winner = first_character
      loser = second_character
      add_points(winner, loser)
      puts "#{winner.name} won"
    elsif (strength1 < strength2)
      winner = second_character
      loser = first_character
      add_points(winner, loser)
      puts "#{winner.name} won"
    else
      puts "It's a tie!"
    end
  end

  def add_points (w, l)
    lvl_diff = l.level - w.level

    w.level += (w.is_a? Warrior) && lvl_diff >= 0 ? lvl_diff + 1 : 0
  end
end
