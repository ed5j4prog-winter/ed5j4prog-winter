require_remote "defender/defender.rb"
require_remote "bullet/bulletA.rb"
include Math

class DefenderA < Defender
  def initialize(x, y, game)
    image = Image.load('/images/Defender/Defender_00.png')
    super(30, 1000, 10, game, x, y, image) #hp, ダメージを定義(gameは入れといて)
    @t = 0
    direction = Math.atan2((self.y - Window.height / 2),(self.x - Window.width / 2)) *180 / Math::PI
    self.angle = direction
  end

  def update
    @t += 1
    if(@t % 80 == 0)
      shot_bullet(BulletA.new(self.x, self.y, self.angle))
    end
  end
end