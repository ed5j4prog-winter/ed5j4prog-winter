require_remote "enemy.rb"
include Math

class EnemyF < Enemy
  def initialize(x, y)
    image = Image.load('/images/Enemy/Enemy_00.png')
    super(30, 10, 1, x, y, image) #hp, ダメージ, 報酬を定義
    @time = 0
  end
  
  def update
    # 向きを中心方向に変更
    direction = Math.atan2((240 - self.y),(320 - self.x)) * 180 / Math::PI
    self.angle = direction + 90
    # 中心に向かって移動
    self.x += Math.cos(direction)
    self.y += Math.sin(direction)
    # ランダムワープ
    if @time % 120 == 0
        self.x += rand(1..100) - 50
        self.y += rand(1..100) - 50
    end
    @time += 1
  end
end