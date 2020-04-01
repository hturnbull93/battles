require 'player'

class Game
  def attack(target)
    target.take_damage
  end
end