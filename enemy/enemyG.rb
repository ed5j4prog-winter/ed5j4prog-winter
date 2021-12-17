require_remote "enemy/enemy.rb"
include Math

class EnemyG < Enemy
  def initialize(x, y, game)
    image = Image.load('/images/Enemy/Enemy_05.png')
    super(3000, 100, 1000, x, y, image) #hp, ダメージ, 報酬を定義
    @time = 0
    @game = game
  end
  
  def attack(damage)
    @hp -= damage
    if(@hp <= 0)
      @game.game_clear
      self.vanish
    end
  end
  
  def update
    # 向きを中心方向に変更
    direction = Math.atan2((240 - self.y),(320 - self.x)) * 180 / Math::PI
    self.angle = direction + 90
    # 巣の周りをまわる
    self.x += Math.cos((direction + 88) / 180 * Math::PI)
    self.y += Math.sin((direction + 88) / 180 * Math::PI)
    # ザコを召喚
    if @time % 300 == 100
        for i in 0..2 do
            number = rand(0..4)
            if number == 0
                @game.add_enemy(EnemyA.new(self.x + rand(-20..20), self.y(-20..20)))
            elsif number == 1
                @game.add_enemy(EnemyB.new(self.x + rand(-20..20), self.y(-20..20)))
            elsif number == 2
                @game.add_enemy(EnemyC.new(self.x + rand(-20..20), self.y(-20..20)))
            elsif number == 3
                @game.add_enemy(EnemyD.new(self.x + rand(-20..20), self.y(-20..20)))
            else
                @game.add_enemy(EnemyE.new(self.x + rand(-20..20), self.y(-20..20)))
            end
        end
    end
    @time += 1
  end
end