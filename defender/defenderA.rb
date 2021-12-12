require_remote "defender/defender.rb"
require_remote "bullet/bulletA.rb"

class DefenderA < Defender
  def initialize(x, y, game)
    image = Image.new(40,40).circle_fill(20,20,10, [255,255,255])
    super(10, 10, 1000, game, x, y, image, [0, 0, 20]) #hp, ダメージを定義(gameは入れといて)
    @t = 0
  end

  def update
    @t += 1
    if(@t % 60 == 0)
      shot_bullet(BulletA.new(self.x, self.y))
    end
  end
end