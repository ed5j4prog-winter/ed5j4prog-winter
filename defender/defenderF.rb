require_remote "defender/defender.rb"
require_remote "bullet/bulletF.rb"
include Math

class DefenderF < Defender
  def initialize(x, y, game)
    image = Image.load('/images/Defender/Defender_05.png')
    super(50, 1000, 2000, game, x, y, image) #hp, ダメージを定義(gameは入れといて)
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
    # triple shot
    if(@t % 70 == 0)
      shot(BulletF.new(self.x, self.y, self.angle))
      shot(BulletF.new(self.x, self.y, self.angle + 30))
      shot(BulletF.new(self.x, self.y, self.angle - 30))
    end
    self.x -= 50 / 4
    self.y -= 40 / 4
  end
end