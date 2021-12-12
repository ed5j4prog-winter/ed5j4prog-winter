class Bullet < Sprite
  def initialize(damage, x, y, angle, image)
    @damage = damage
    super(x, y, image)
    self.angle = angle
  end

  def hit(other)
    other.attack(@damage)
    self.vanish
  end

  def attack(damage)
  end
end