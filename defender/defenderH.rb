require_remote "defender/defender.rb"
include Math

class DefenderH < Defender
  def initialize(x, y, game)
    image = Image.load('/images/Defender/Defender_07.png')
    super(500, 1000, 20, game, x, y, image) #hp, ダメージを定義(gameは入れといて)
    @t = 0
    direction = Math.atan2((self.y - Window.height / 2),(self.x - Window.width / 2)) *180 / Math::PI
    self.angle = direction
    #サイズを大きく
  end

  def update
    @t += 1
  end
end