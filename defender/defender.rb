class Defender < Sprite
  def initialize(hp, damage, cost, game, x, y, image)
    @hp = hp
    @damage = damage
    @game = game
    @cost = cost
    super(x, y, image)
  end

  def shot(bullet)
    @game.add_bullet(bullet)
  end

  def hit(other)
    other.attack(@damage)
  end

  def attack(damage)
    @hp -= damage
    if(@hp <= 0)
      self.vanish
    end
  end
end