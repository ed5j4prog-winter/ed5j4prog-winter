require_remote "defender/defender.rb"
require_remote "bullet/bulletC.rb"
include Math

class DefenderC < Defender
  def initialize(x, y, game)
    image = Image.load('/images/Defender/Defender_02.png')
    super(80, 1000, 2000, game, x, y, image) #hp, ダメージを定義(gameは入れといて)
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
      shot(BulletC.new(self.x, self.y, self.angle))
    end
    self.x -= 50 / 4
    self.y -= 40 / 4
  end
end