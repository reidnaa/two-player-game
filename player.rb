module MathGame

class Player
  attr_accessor :name, :lives

  def initialize(name)
    @name = name
    @lives = 3
  end

  def lose_life
    @lives -= 1
  end

  end

end

# p = Player.new('Reid')
# puts p.name
# puts p.lives
# p.reduce_lives
# puts p.lives