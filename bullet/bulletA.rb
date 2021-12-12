require_remote "bullet/bullet.rb"

class BulletA < Bullet
  def initialize(x, y)
    image = Image.new(40,40).circle_fill(20,20,10, [255,255,255])
    super(10, x, y, image) #ダメージを定義
  end
  
  def update
    self.x -= 1
  end
end