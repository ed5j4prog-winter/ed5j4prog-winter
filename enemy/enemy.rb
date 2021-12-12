class Enemy < Sprite
  def initialize(hp, damage, drop, x, y, image)
    super(x, y, image)
    @hp = hp
    @damage = damage
    @drop = drop
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