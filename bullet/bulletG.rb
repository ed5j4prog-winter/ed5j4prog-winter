require_remote "bullet/bullet.rb"

class BulletA < Bullet
  def initialize(x, y, angle)
    image = Image.load('/images/Bullet/Bullet_00.png')
    super(10, x, y, angle, image) #ダメージを定義
  end
  
  def update
    self.x += Math.cos(self.angle/180 * Math::PI) / 2
    self.y += Math.sin(self.angle/180 * Math::PI) / 2
  end
end