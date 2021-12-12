require_remote "bullet/bullet.rb"

class BulletB < Bullet
  def initialize(x, y, angle)
    image = Image.load('/images/Bullet/Bullet_01.png')
    super(30, x, y, angle, image) #ダメージを定義
  end
  
  def update
    self.x += Math.cos(self.angle) / 2
    self.y += Math.sin(self.angle) / 2
  end
end