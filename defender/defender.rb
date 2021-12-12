class Defender < Sprite
  def initialize(hp, damage, cost, game, x, y, image, collision = [0, 0, 20])
    @hp = hp
    @damage = damage
    @game = game
    @cost = cost
    super(x, y, image)
    self.collision = collision
  end

  def shot_bullet(bullet)
    @game.add_bullet(bullet)
  end

  # Enemyと当たったとき呼ばれる
  def hit(enemy)
    enemy.attack(@damage)
  end

  def attack(damage)
    @hp -= damage
    if(@hp <= 0)
      self.vanish
    end
  end

  def type
    "defender"
  end
end