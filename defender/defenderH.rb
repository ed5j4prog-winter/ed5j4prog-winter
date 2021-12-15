require_remote "defender/defender.rb"
include Math

class DefenderH < Defender
  def initialize(x, y, game)
    image = Image.load('/images/Defender/Defender_00.png')
    super(2000, 1000, 2000, game, x, y, image) #hp, ダメージを定義(gameは入れといて)
    @t = 0
    direction = Math.atan2((self.y + image.height - Window.height / 2),(self.x  + image.width - Window.width / 2))*180 / Math::PI
    self.angle = direction
    self.x -= 50 / 2
    self.y -= 40 / 2
    #サイズを大きく
  end

  def update
    @t += 1
    self.x += 50 / 4
    self.y += 40 / 4
    self.x -= 50 / 4
    self.y -= 40 / 4
  end
end