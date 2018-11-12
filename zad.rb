{\rtf1\ansi\deff0\nouicompat{\fonttbl{\f0\fnil\fcharset0 Calibri;}{\f1\fnil\fcharset238 Calibri;}}
{\*\generator Riched20 10.0.17134}\viewkind4\uc1 
\pard\sa200\sl276\slmult1\f0\fs22\lang21 class Character\par
  attr_accessor :name, :level\par
  def initialize(name:, level:)\par
    self.name = name\par
    self.level = level\par
  end\par
  def card\par
    "#\{name\} (lvl #\{level\})"\par
  end \par
  def strength\par
    @level + [*1..12].sample\par
  end\par
end\par
class Warrior < Character\par
  def lvlup n\par
    self.level += n\par
  end\par
\par
end\par
\par
class Monster < Character\par
end\par
\par
class BattleArena\par
  attr_accessor :first_character, :second_character\par
\par
  def initialize(first_character, second_character)\par
    self.first_character = first_character\par
    self.second_character = second_character\par
  end\par
\par
  def battle!\par
    damage1 = first_character.strength\par
    damage2 = second_character.strength\par
    fight(damage1, damage2)\par
    who_dealt_more_damage(damage1, damage2)\par
  end\par
  def fight(damage1, damage2)\par
    puts "#\{first_character.name\} atakuje #\{second_character.name\} z #\{damage1\} si\f1\'b3y"\par
    puts "#\{second_character.name\} atakuje #\{first_character.name\} z #\{damage2\} si\'b3y"\par
  end\par
  def who_dealt_more_damage(damage1, damage2)\par
    if(damage1 > damage2) \par
      puts first_character.name  + " Wygra\'b3"\par
      level_up(first_character, second_character)\par
    elsif (damage2 > damage1)\par
      puts second_character.name + " Wygra\'b3"\par
      level_up(second_character, first_character)\par
    else\par
      puts "remis"\par
    end\par
  end\par
\par
  def level_up(winner, loser)\par
    if winner.is_a? Warrior\par
      if winner.level < loser.level\par
        winner.level += 1\par
      elsif winner.level == loser.level\par
        winner.level += 1\par
      elsif winner.level > loser.level\par
        winner.level += 1\par
      end\par
    end\par
  end\par
end\par
warrior1 = Warrior.new(name: 'Po', level:  1)\par
warrior2 = Warrior.new(name: 'Tai Lung', level: 1)\par
monster1 = Monster.new(name: 'Skeleton Mage', level: 15)\par
\par
arena = BattleArena.new(warrior1,warrior2)\par
arena.battle!\par
puts warrior1.card\par
puts warrior2.card\par
\par
arena = BattleArena.new(warrior1,monster1)\par
arena.battle!\par
puts warrior1.card\par
puts monster1.card\par
\par
\f0\par
}
 