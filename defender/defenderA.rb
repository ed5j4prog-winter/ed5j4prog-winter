require_remote "defender/defender.rb"
require_remote "bullet/bulletA.rb"
include Math

class DefenderA < Defender
  def initialize(x, y, game)
    image = Image.load('/images/Defender/Defender_00.png')
    super(100, 10, 1000, game, x, y, image) #hp, ダメージを定義(gameは入れといて)
    @t = 0
    p self.y - Window.height / 2
    p self.x - Window.width / 2
    p self.x
    p self.y
    direction = Math.atan2((self.y + image.height - Window.height / 2),(self.x  + image.width - Window.width / 2))*180 / Math::PI
    self.angle = direction
    self.x -= 50 / 2
    self.y -= 40 / 2
    p self.x
    p self.y
  end

  def update
    # self.angle += 1
    @t += 1
    self.x += 50 / 4
    self.y += 40 / 4
    if(@t % 80 == 0)
      shot(BulletA.new(self.x, self.y, self.angle))
    end
    self.x -= 50 / 4
    self.y -= 40 / 4
  end

end