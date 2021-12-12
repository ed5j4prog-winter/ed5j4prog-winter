class Enemy < Sprite
  def initialize(hp, damage, drop, x, y, image)
    super(x, y, image)
    @hp = hp
    @damage = damage
    @drop = drop
  end

  # Defenderと当たったとき呼ばれる
  def shot(defender)
    defender.attack(@damage)
  end

  # Bulletと当たったとき呼ばれる
  def hit(bullet)
    # なにもしない
  end

  def attack(damage)
    @hp -= damage
    if(@hp <= 0)
      self.vanish
    end
  end
end