class Bullet < Sprite
  def initialize(damage, x, y, image)
    self.x = x
    self.y = y
    @damage = damage
    super(x, y, image)
  end

  def hit(other)
    other.attack(@damage)
    self.vanish
  end

  def attack(damage)
  end
end