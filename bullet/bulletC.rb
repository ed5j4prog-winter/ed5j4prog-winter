require_remote "bullet/bullet.rb"

class BulletC < Bullet
  def initialize(x, y, angle)
    image = Image.load('/images/Bullet/Bullet_02.png')
    super(60, x, y, angle, image) #ダメージを定義
  end
  
  def update
    super()
    self.x += Math.cos(self.angle) / 2
    self.y += Math.sin(self.angle) / 2
  end
end