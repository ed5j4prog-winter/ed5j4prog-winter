class Bullet < Sprite
  def initialize(damage, x, y, angle, image)
    @damage = damage
    super(x, y, image)
    self.angle = angle
    self.collision = [12,10,5]
  end

  # Enemyと当たったとき呼ばれる
  def shot(other)
    other.attack(@damage)
    self.vanish
  end

  def attack(damage)
  end
  
  def update
    if (self.x < 30 || self.x > Window.width - 30 || self.y < -20 || self.y > Window.height + 20)
      self.vanish
    end
  end

  def offset
    {x: -12, y: -10}
  end
end