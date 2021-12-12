require_remote "enemy/enemy.rb"
include Math

class EnemyE < Enemy
  def initialize(x, y)
    image = Image.load('/images/Enemy/Enemy_03.png')
    super(100, 10, 6, x, y, image) #hp, ダメージ, 報酬を定義
  end
  
  def update
    # 向きを中心方向に変更
    direction = Math.atan2((240 - self.y),(320 - self.x)) * 180 / Math::PI
    self.angle = direction + 90
    # 中心に向かって移動
    self.x += Math.cos(direction) / 2
    self.y += Math.sin(direction) / 2
  end
end