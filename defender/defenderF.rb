require_remote "defender/defender.rb"
require_remote "bullet/bulletF.rb"
include Math

class DefenderF < Defender
  def initialize(x, y, game)
    image = Image.load('/images/Defender/Defender_05.png')
    super(50, 1000, 20, game, x, y, image) #hp, ダメージを定義(gameは入れといて)
    @t = 0
    direction = Math.atan2((self.y - Window.height / 2),(self.x - Window.width / 2)) *180 / Math::PI
    self.angle = direction
  end

  def update
    @t += 1
    # triple shot
    if(@t % 70 == 0)
      shot_bullet(BulletF.new(self.x, self.y, self.angle))
      shot_bullet(BulletF.new(self.x, self.y, self.angle + 30))
      shot_bullet(BulletF.new(self.x, self.y, self.angle - 30))
    end
  end
end