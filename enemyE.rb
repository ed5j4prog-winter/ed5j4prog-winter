require_remote "enemy.rb"
include Math

class EnemyE < Enemy
  def initialize(x, y)
    image = Image.load('/images/Enemy/Enemy_03.png')
    super(100, 10, 6, x, y, image) #hp, ダメージ, 報酬を定義
    @beforeHP = @hp
    @slow = 0
  end
  
  def update
    # 向きを中心方向に変更
    direction = Math.atan2((240 - self.y),(320 - self.x)) * 180 / Math::PI
    self.angle = direction + 90
    #HPが減った時スロウを付与
    if @hp < @beforeHP
        @slow = 1 * 60
        @beforeHP = @hp
    end
    # 中心に向かって移動
    if @slow > 0
        self.x += Math.cos(direction) / 6 / 2
        self.y += Math.sin(direction) / 6 / 2
        @slow -= 1
    else
        self.x += Math.cos(direction) / 6
        self.y += Math.sin(direction) / 6
    end
  end
end