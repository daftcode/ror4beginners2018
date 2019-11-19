class Character

  attr_accessor :name, :level

  def initialize(name:, level:)
    @name=name
    @level=level
  end

  def strength
    @level+[*1..12].sample
  end

  def card
    "#{@name} (lvl #{@level})"
  end

end

class Warrior<Character

  def level_up(opponent)
    if @level<opponent.level
       @level=opponent.level+1
    elsif @level==opponent.level
       @level+=1
    end

  end
end
class Monster<Character
end


class BattleArena
	attr_accessor :first_character, :second_character

  def initialize(first_character:, second_character:)
	@first_character=first_character
	@second_character=second_character
  end

  def battle!
    dmg1=@first_charater.strength
    dmg2=@second_character.strength
	  
    puts "#{@first_character.name} attacked #{@second_character.name} with #{dmg1} damage"
    puts "#{@second_character.name} attacked #{@first_character.name} with #{dmg2} damage"
    if dmg1>dmg2 
     puts "#{@first_character.name} won!"
     @first_character.level_up(@second_character) if @first_character.is_a? Warrior
    elsif dmg1<dmg2
      puts "#{@second_character.name} won!"
      @second_character.level_up(@first_character) if @second_character.is_a? Warrior
    else
      puts "It is a tie."
    end

  end
end

warrior1 = Warrior.new(name: 'Po', level:  1)
warrior2 = Warrior.new(name: 'Tai Lung', level: 1)
monster1 = Monster.new(name: 'Skeleton Mage', level: 15)


arena = BattleArena.new(warrior1, warrior2)
arena.battle!

print warrior1.card

arena = BattleArena.new(warrior1, monster1)
arena.battle!
print monster1.card

