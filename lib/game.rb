require_relative 'player'

class Game
  def initialize(p1_name, p2_name, player_class = Player)
    @p1 = player_class.new(p1_name)
    @p2 = player_class.new(p2_name)
  end
  
  attr_reader :p1, :p2

  def attack(target)
    target.take_damage
  end

end