class Character
  attr_reader :name, :level, :add_points

  def initialize(name:, level:)
    @name = name
    @level = instance_error(level)
  end

  def strength
    level + [*1..12].sample
  end

  def card
    "#{name} (lvl #{level})"
  end

  def instance_error(input)
      raise ArgumentError, 'Character can\'t be created. Level should be between 0 and 99.' unless input.is_a?(Integer) && input.between?(0, 99) 
      input
  end

  def add_points(opponent)
  end
end

class Warrior < Character
  attr_writer :level

  def add_points(opponent)
    lvl_diff = opponent.level - self.level

    if (lvl_diff >= 0)
      self.level += lvl_diff + 1
      puts "#{self.name} got promoted to level #{self.level}!"
    end
  end
end

class Monster < Character
end

class BattleArena
  attr_reader :first_character, :second_character

  def initialize(first_character:, second_character:)
    @first_character = first_character
    @second_character = second_character
  end

  def battle!
    strength1 = first_character.strength
    strength2 = second_character.strength
    winner, loser = nil, nil

    fight([first_character, second_character], strength1)
    fight([second_character, first_character], strength2)

    case(strength1 <=> strength2)
      when 1
        winner, loser = [first_character, second_character]
        puts "#{winner.name} wins"
      when -1
        winner, loser = [second_character, first_character]
        puts "#{winner.name} wins"
      when 0
        puts "It's a tie!"
    end

    if (!!winner) then winner.add_points(loser); end

  end

  private

  def fight(competitors, strength)
    puts "#{competitors[0].name} attacked #{competitors[1].name} with #{strength} damage"
  end

end