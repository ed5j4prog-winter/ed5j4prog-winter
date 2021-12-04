require_remote "defender.rb"
require_remote "bulletA.rb"

class DefenderA < Defender
  def initialize(x, y, game)
    image = Image.new(40,40).circle_fill(20,20,10, [255,255,255])
    super(100, 10, 1000, game, x, y, image) #hp, ダメージを定義(gameは入れといて)
    @t = 0
  end

  def update
    @t += 1
    if(@t % 60 == 0)
      shot(BulletA.new(self.x, self.y))
    end
  end
end