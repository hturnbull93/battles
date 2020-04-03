class Player

  DEFAULT_HP = 100
  STANDARD_DAMAGE = 5
  BONUS_DAMAGE = 0..10

  def initialize(name)
    @name = name
    @hp = DEFAULT_HP
  end

  attr_reader :name, :hp

  def take_damage
    @hp -= STANDARD_DAMAGE + rand(BONUS_DAMAGE)
  end
end