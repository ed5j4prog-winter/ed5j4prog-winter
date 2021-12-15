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
  
  def update
    if self.x < 0 || self.x > Window.width || self.y < 0 || self.y > Window.height
      self.vanish
    end
  end
end