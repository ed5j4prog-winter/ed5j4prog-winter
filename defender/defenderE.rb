require_remote "defender/defender.rb"
require_remote "bullet/bulletE.rb"
include Math

class DefenderE < Defender
  def initialize(x, y, game)
    image = Image.load('/images/Defender/Defender_04.png')
    super(200, 1000, 2000, game, x, y, image) #hp, ダメージを定義(gameは入れといて)
    @t = 0
    direction = Math.atan2((self.y + image.height - Window.height / 2),(self.x  + image.width - Window.width / 2))*180 / Math::PI
    self.angle = direction
    p self.angle
    self.x -= 50 / 2
    self.y -= 40 / 2
  end

  def update
    @t += 1
    self.x += 50 / 4
    self.y += 40 / 4
    # double shot
    if(@t % 70 == 0)
      shot(BulletE.new(self.x + ((Math.cos((self.angle + 90)/180 * Math::PI) / 2) * 20), 
      self.y + ((Math.sin((self.angle + 90)/180 * Math::PI) / 2) * 20), 
      self.angle))
      shot(BulletE.new(self.x + ((Math.cos((self.angle - 90)/180 * Math::PI) / 2) * 20), 
      self.y + ((Math.sin((self.angle - 90)/180 * Math::PI) / 2) * 20), 
      self.angle))
    end
    self.x -= 50 / 4
    self.y -= 40 / 4
  end
end