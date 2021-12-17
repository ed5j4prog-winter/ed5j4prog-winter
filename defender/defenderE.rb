require_remote "defender/defender.rb"
require_remote "bullet/bulletE.rb"
include Math

class DefenderE < Defender
  def initialize(x, y, game)
    image = Image.load('/images/Defender/Defender_04.png')
    super(50, 1000, 20, game, x, y, image) #hp, ダメージを定義(gameは入れといて)
    @t = 0
    direction = Math.atan2((self.y - Window.height / 2),(self.x - Window.width / 2)) *180 / Math::PI
    self.angle = direction
  end

  def update
    @t += 1
    # double shot
    if(@t % 70 == 0)
      shot_bullet(BulletE.new(self.x + ((Math.cos((self.angle + 90)/180 * Math::PI) / 2) * 20), 
      self.y + ((Math.sin((self.angle + 90)/180 * Math::PI) / 2) * 20), 
      self.angle))
      shot_bullet(BulletE.new(self.x + ((Math.cos((self.angle - 90)/180 * Math::PI) / 2) * 20), 
      self.y + ((Math.sin((self.angle - 90)/180 * Math::PI) / 2) * 20), 
      self.angle))
    end
  end
end