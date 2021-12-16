require_remote "defender/defender.rb"
require_remote "bullet/bulletB.rb"
include Math

class DefenderB < Defender
  def initialize(x, y, game)
    image = Image.load('/images/Defender/Defender_01.png')
    super(50, 1000, 1500, game, x, y, image) #hp, ダメージを定義(gameは入れといて)
    @t = 0
    direction = Math.atan2((self.y + image.height - Window.height / 2),(self.x  + image.width - Window.width / 2))*180 / Math::PI
    self.angle = direction
    self.x -= 50 / 2
    self.y -= 40 / 2
  end

  def update
    @t += 1
    self.x += 50 / 4
    self.y += 40 / 4
    if(@t % 70 == 0)
      shot(BulletB.new(self.x, self.y, self.angle))
    end
    self.x -= 50 / 4
    self.y -= 40 / 4
  end
end