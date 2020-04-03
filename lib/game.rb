require_relative 'player'

class Game
  def self.create(p1_name, p2_name)
    @game = Game.new(p1_name, p2_name)
  end

  def self.instance
    @game
  end

  def initialize(p1_name, p2_name, player_class = Player)
    @p1 = player_class.new(p1_name)
    @p2 = player_class.new(p2_name)
    @active = @p1
    @target = @p2
    @winner = nil
    @loser = nil
  end
  
  attr_reader :p1, :p2, :active, :target, :winner, :loser

  def attack
    @target.take_damage
    switch_roles
    check_winner
  end

  private

  def check_winner
    @winner, @loser = @p1, @p2 if @p2.hp <= 0
    @winner, @loser = @p2, @p1 if @p1.hp <= 0
  end


  def switch_roles
    @active, @target = @target, @active
  end
end