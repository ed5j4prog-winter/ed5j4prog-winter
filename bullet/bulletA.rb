require_remote "bullet/bullet.rb"

class BulletA < Bullet
  def initialize(x, y, angle)
    image = Image.load('/images/Bullet/Bullet_00.png')
    super(10, x, y, angle, image) #ダメージを定義
  end
  
  def update
    super()
    self.x += Math.cos(self.angle/180 * Math::PI)
    self.y += Math.sin(self.angle/180 * Math::PI)
  end
end