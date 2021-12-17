require_remote "defender/defender.rb"
require_remote "bullet/bulletG.rb"
include Math

class DefenderG < Defender
  def initialize(x, y, game)
    image = Image.load('/images/Defender/Defender_06.png')
    super(80, 1000, 20, game, x, y, image) #hp, ダメージを定義(gameは入れといて)
    @t = 0
    direction = Math.atan2((self.y - Window.height / 2),(self.x - Window.width / 2)) *180 / Math::PI
    self.angle = direction
  end

  def update
    @t += 1
    if(@t % 80 == 0)
      shot_bullet(BulletG.new(self.x, self.y, self.angle))
    end
  end
end