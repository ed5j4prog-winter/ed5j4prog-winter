require_remote "defender/defender.rb"
require_remote "bullet/bulletB.rb"
include Math

class DefenderB < Defender
  def initialize(x, y, game)
    image = Image.load('/images/Defender/Defender_01.png')
    super(50, 1000, 15, game, x, y, image) #hp, ダメージを定義(gameは入れといて)
    @t = 0
    direction = Math.atan2((self.y - Window.height / 2),(self.x - Window.width / 2)) *180 / Math::PI
    self.angle = direction
  end

  def update
    @t += 1
    if(@t % 70 == 0)
      shot_bullet(BulletB.new(self.x, self.y, self.angle))
    end
  end
end