require_relative 'player'

class Game
  def initialize(p1_name, p2_name, player_class = Player)
    @p1 = player_class.new(p1_name)
    @p2 = player_class.new(p2_name)
    @active = @p1
    @target = @p2
  end
  
  attr_reader :p1, :p2, :active, :target

  def attack
    @target.take_damage
    switch_roles
  end

  private

  def switch_roles
    @active, @target = @target, @active
  end
end