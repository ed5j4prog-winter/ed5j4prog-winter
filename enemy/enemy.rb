class Enemy < Sprite
  attr_reader :drop
  def initialize(hp, damage, drop, x, y, image)
    super(x, y, image)
    @hp = hp
    @damage = damage
    @drop = drop
    self.collision = [25, 20, 10]
  end

  # Defender、または卵と当たったとき呼ばれる
  def shot(defender)
    defender.attack(@damage)
    if defender.type == "egg"
        #p self.x
        #p self.y
        self.vanish
    end
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

  def offset
    {x: -25, y: -20}
  end
end