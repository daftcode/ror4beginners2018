module Fightable
  ##
  # Strength is used to calculate character 'power' during the fight it sums character lv and rolls d12
  def strength
    defined?(level) ? level + [*1..12].sample : [*1..12].sample
  end
end

##
# This class represents basic character in game containing must have values to define single identity
class Character

  include Fightable

  ##
  # Allows the user to identify the created character during the program runtime
  attr_accessor :name

  ##
  # Level defines the character level but is also used as it's base damge value
  attr_reader :level

  def initialize(name: nil, level: nil)
    @name = name
    @level = level_valid?(level)
  end

  def level=(new_level)
    @level = level_valid?(new_level)
  end

  ##
  # Card returns a short description of character
  def card
    "This is #{@name} he is #{Character.to_s} with level: #{@level}."
  end

  protected

  # Defines min level character can have
  def self.MIN_LEVEL
    1
  end

  # Defines max level character can have
  def self.MAX_LEVEL
    99
  end

  ##
  # Checks if level is valid by first checking if its in described range and if not and var was nil asings MIN_LEVEL as starter level
  def level_valid?(new_level)
    new_level.between?(Character.MIN_LEVEL, Character.MAX_LEVEL) ? new_level : @level ||= Character.MIN_LEVEL
  end

end


##
# This class represents a warrior who can join a BattleArena and gain exp
class Warrior < Character
  def initialize(name: nil, level: nil)
    super(name: name, level: level)
  end

  ##
  # Gives expirience to a warrior but only if his enemy is at least of type Character
  # If enemy is same or lower level warrior gets 1 lv if enemy has higher level he gets enough to eqauls him
  def gain_exp(rival)
    if (rival.class <= Character)
      @level >= rival.level ? @level += 1 : @level += rival.level
    else
      puts "Rival needs to be at least a character, come on don't be a coward!"
    end
  end

end

##
# This class represents a monster who can join a BattleArena
class Monster < Character
  def initialize(name: nil, level: nil)
    super(name: name, level: level)
  end

end

class BattleArena
  attr_accessor :first_character, :second_character
  def initialize(first_character, second_character)
    # TODO: Add error handling for wrong types?
    if (first_character.class <= Character && second_character.class <= Character)
      self.first_character = first_character
      self.second_character = second_character
    else
      puts "Can't work with those types: #{first_character.class} #{second_character.class}"
    end
  end

  ##
  # Battle simulates a fight between two characters
  # Rules:
  # each character sums his level with dice roll (12d) and function compare it
  # afterwards grants exp if character was a warrior for more see gain_exp Warrior method 
  def battle!

    first_name = self.first_character.name
    first_damage = self.first_character.strength
    second_name = self.second_character.name
    second_damage = self.second_character.strength

    puts "#{first_name} attacked #{second_name} with #{first_damage}"
    puts "#{second_name} attacked #{first_name} with #{second_damage}"

    # Thought of implementation with first declaring winner with ternary operator but how to handle draw with it
    if first_damage > second_damage
      puts "#{first_name} won"
      self.first_character.gain_exp(self.second_character) if first_character.class == Warrior
    elsif second_damage > first_damage
      puts "#{second_name} won"
      self.second_character.gain_exp(self.first_character) if second_character.class == Warrior
    else 
      # TODO: Implement smt more on a draw?
      puts "it's a draw!"
    end

  end

end

# Tests:
# Hope will work 

# -- preparations
warrior1 = Warrior.new(name: 'Po', level:  1)
warrior2 = Warrior.new(name: 'Tai Lung', level: 1)
monster1 = Monster.new(name: 'Skeleton Mage', level: 15)

arena = BattleArena.new(warrior1, warrior2)
arena.battle!

puts "-- First round results --"
puts warrior1.card
puts warrior2.card

arena = BattleArena.new(warrior1, warrior2)
arena.battle!
puts "-- Second round results --"
puts warrior1.card
puts warrior2.card

arena = BattleArena.new(warrior1, monster1)
arena.battle!

puts "-- Third round results --"
puts warrior1.card
puts monster1.card	