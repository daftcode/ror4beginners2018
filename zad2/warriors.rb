require 'faker'
# Error that has to be raised if the wrong type of characters are entering the BattleArena (non-Character class)
class ArenaEntryError < StandardError
  def message
    'You probably try to make some integers fight each other, you sadistic bastard! Check if the competitors are Characters before inviting them to the Arena.'
  end
end

# Basic character class
class Character
  attr_accessor :name
  attr_accessor :level
  MIN_LVL = 1
  MAX_LVL = 99

  # Constructor
  def initialize name:, level:
    @name = name #@name ?
    @level = eval_level(level)
  end
  
  # This method calculates the strength of characters attack
  def strength
    self.level + [*1..12].sample
  end
  
  # A character card: displays characters attributes.
  def card
    "#{@name} (lvl #{@level}), class: #{self.class}"
  end
  
  # Check if characters level has a valid value (belongs to [1:99]), if outside of the bounds: set the nearest valid integer value.
  def eval_level level
    @level = level.to_i()
	@level = @level>MAX_LVL ? MAX_LVL : @level
    @level = @level<MIN_LVL ? MIN_LVL : @level
	# @level.clamp(MIN_LVL, MAX_LVL) # I have to upgrade to ruby 2.4+ to use this
  end
  
  def winning_message
	puts "#{self.class} #{@name} won."
  end
	
end

# Warrior class
class Warrior < Character
  # Warrior is able to gain levels. This method enables him to do so.
  def level_up enemy_lvl
    # case 1: +1 + level difference for level lower than the opponents level. @level+=1+(enemy_lvl-@level) ==> @level=1+enemy_lvl
    # case 2: +1 for level equal or greater than the opponents level: @level+=1
    @level = @level<enemy_lvl ? eval_level(@level=1+enemy_lvl) : eval_level(@level+=1)
	puts "#{self.class} #{@name} is at level #{@level} now."
  end
  
  def winning_message
	puts "#{self.class} #{@name} won and levelled-up!" 
	#puts "#{self.class} #{@name} is at level #{@level} now."
  end
end

# Monster class
class Monster < Character
  def winning_message
	puts "#{self.class} #{@name} won, but (as #{self.class}) it can't level-up."
  end
end

# BattleArena Class
class BattleArena
  attr_accessor :first_character
  attr_accessor :second_character
  
  # constructor
  def initialize first_character, second_character
    # check if competitors are valid (are Characters or inherit from Character class)
    if first_character.class <= Character && second_character.class <= Character
      self.first_character = first_character
      self.second_character = second_character
    else
      raise ArenaEntryError
    end
  end
  
  # Calling this method makes the characters fight.
  def battle!
    # Fight until the last byte! Break only if one of competitors is victorious.
    loop do
      @first_character_damage = first_character.strength
      @second_character_damage = second_character.strength
      puts "#{first_character.name} (lvl #{first_character.level}) attacked #{second_character.name} (lvl #{second_character.level}) with #{@first_character_damage} damage"
      puts "#{second_character.name} (lvl #{second_character.level}) attacked #{first_character.name} (lvl #{first_character.level}) with #{@second_character_damage} damage"
      break if @first_character_damage != @second_character_damage
    end
    # This happens when the the first character wins...
    if @first_character_damage > @second_character_damage 
      if @first_character.respond_to? :level_up 
        @first_character.level_up @second_character.level
      end
      #puts "#{@first_character.name} won and is at level #{@first_character.level} now." 
	  @first_character.winning_message
    # ...and this if the second character wins.
    else
      if @second_character.respond_to? :level_up 
        @second_character.level_up @first_character.level
      end
      #puts "#{@second_character.name} won and is at level #{@second_character.level} now." 
	  @second_character.winning_message
    end
  end
  
  # This method prints out the fighters data
  def print_competitors
    puts "==========================="
    puts "#{self.class} competitors:"
    puts @first_character.card
    puts @second_character.card
    puts "==========================="
  end
end



character_sets = Array[
'Faker::Name.unique.name'
]

warrior_sets = Array[
'Faker::StarWars.unique.character',
'Faker::LordOfTheRings.unique.character',
'Faker::ElderScrolls.unique.name',
'Faker::Witcher.unique.character',
'Faker::Name.unique.name'
]

# I'd put Faker::Pokemon.name for monsters, but my conscience doesn't allow me to place Pokemon where they can't gain levels
monster_sets = Array[
'Faker::ElderScrolls.unique.creature',
'Faker::Witcher.unique.monster'
]

# Character example
puts ('=========================== Character example ===')
characters = Array.new(1) {Character.new(name: eval(character_sets.sample), level: [*1..5].sample)} 
puts characters.map(&:card)

# Warriors
puts ("\n=========================== Warriors ===")
warriors = Array.new(10) {Warrior.new(name: eval(warrior_sets.sample), level: [*1..5].sample)} 
puts warriors.map(&:card)

# Monsters
puts ("\n=========================== Monsters ===")
monsters = Array.new(10) {Monster.new(name: eval(monster_sets.sample), level: [*1..5].sample)} 
puts monsters.map(&:card)

Faker::UniqueGenerator.clear

puts ("\n=========================== 2 warriors ===")
competitors = warriors.sample(2)
arena = BattleArena.new(competitors[0], competitors[1])
arena.print_competitors
arena.battle!
arena.print_competitors

puts ("\n=========================== warrior vs monster ===")
competitors = Array[warriors.sample, monsters.sample]
arena = BattleArena.new(competitors[0], competitors[1])
arena.print_competitors
arena.battle!
arena.print_competitors

puts ("\n=========================== 2 monsters ===")
competitors = monsters.sample(2)
arena = BattleArena.new(competitors[0], competitors[1])
arena.print_competitors
arena.battle!
arena.print_competitors



exit
