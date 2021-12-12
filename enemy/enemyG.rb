require_remote "enemy/enemy.rb"
include Math

class EnemyG < Enemy
  def initialize(x, y, game)
    image = Image.load('/images/Enemy/Enemy_05.png')
    super(3000, 100, 1000, x, y, image) #hp, ダメージ, 報酬を定義
    @time = 0
    @game = game
  end
  
  def update
    # 向きを中心方向に変更
    direction = Math.atan2((240 - self.y),(320 - self.x)) * 180 / Math::PI
    self.angle = direction + 90
    # 巣の周りをまわる
    self.x += Math.cos((direction + 88) / 180 * Math::PI)
    self.y += Math.sin((direction + 88) / 180 * Math::PI)
    # ザコ(enemyA)を召喚
    if @time % 300 == 0
        @game.add_enemy(EnemyA.new(self.x, self.y))
    end
    @time += 1
  end
end