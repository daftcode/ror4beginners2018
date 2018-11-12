class InputError < StandardError
  def message
    'Wrong input'
  end
end

class Character
  attr_reader :name
  attr_accessor :level

  def initialize(name: nil, level: 1)
    if name.is_a?(String)
      @name = name
    else
      raise InputError
    end

    if level.is_a?(Integer) && level > 0 && level <= 99
      @level = level
    else
      raise InputError
    end
  end

  def card
    puts "#{name} (lvl #{level})"
  end

  def strength
    level + [*1..12].sample
  end
end

class Warrior < Character

end

class Monster < Character

end

class BattleArena
  attr_reader :first_character, :second_character

  def initialize(first_character, second_character)
    @first_character = first_character
    @second_character = second_character
  end

  def battle!
    dmg_first_char = @first_character.strength
    dmg_second_char = @second_character.strength

    battle_msg(@first_character, @second_character, dmg_first_char)
    battle_msg(@second_character, @first_character, dmg_second_char)

    if dmg_first_char > dmg_second_char
      battle_won(@first_character, @second_character)
    elsif dmg_first_char < dmg_second_char
      battle_won(@second_character, @first_character)
    else
      puts 'Draw'
    end
  end

  private

  def battle_won(winner, loser)
    win_message(winner)
    if winner.is_a? Warrior
      level_inc = level_up(winner, loser)
      if (winner.level + level_inc) > 99
        winner.level = 99
      else
        winner.level += level_inc
      end
    end
  end

  def battle_msg(first, second, strength)
    puts "#{first.name} attacked #{second.name} with #{strength}"
  end

  def win_message winner
    puts "#{winner.name} won"
  end

  def level_up(winner, loser)
    if winner.level == loser.level
      1
    elsif loser.level > winner.level
      loser.level - winner.level + 1
    else
      0
    end
  end
end



warrior1 = Warrior.new(name: 9, level:  1)
warrior2 = Warrior.new(name: 'Tai Lung', level: 95)
monster1 = Monster.new(name: 'Skeleton Mage', level: 15)

warrior1.card # => Po (lvl 1)
warrior1.strength # => 6
warrior1.strength # => 5
warrior2.card # => Tai Lung (lvl 1)
monster1.card # => Skeleton Mage (lvl 15)


arena = BattleArena.new(warrior1, warrior2)
arena.battle!
# ->  Po attacked Tai Lung with 6 damage
# ->  Tai Lung attacked Po with 8 damage
# ->  Tai Lung won

warrior1.card # => Po (lvl 1)
warrior2.card # => Tai Lung (lvl 2)


arena.battle!
# ->  Po attacked Tai Lung with 10 damage
# ->  Tai Lung attacked Po with 7 damage
# ->  Po won
warrior1.card # => Po (lvl 3)
warrior2.card


arena = BattleArena.new(warrior1, monster1)
arena.battle!
# ->  Po attacked Skeleton Mage with 13 damage
# ->  Skeleton Mage attacked Po with 18 damage
# ->  Skeleton Mage won

monster1.card # => Skeleton Mage (lvl 15)
warrior1.card
