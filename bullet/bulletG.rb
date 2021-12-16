require_remote "bullet/bullet.rb"

class BulletG < Bullet
  def initialize(x, y, angle)
    image = Image.load('/images/Bullet/Bullet_06.png')
    super(50, x, y, angle, image) #ダメージを定義
    @state = 0
  end
  
  def shot(other)
    p "shot(G) Called"
    if (@state <= 0)
      self.image = Image.new(40,40).circle_fill(20,20,20, [255,0,0])
      self.collision = [20,20,20]
      @state = 20
    else
      other.attack(@damage)
    end
  end
  
  def update
    if (@state <= 0)
      self.x += Math.cos(self.angle/180 * Math::PI) / 2
      self.y += Math.sin(self.angle/180 * Math::PI) / 2
    elsif (@state == 1)
      self.vanish
    else
      @state -= 1;
    end
  end
end