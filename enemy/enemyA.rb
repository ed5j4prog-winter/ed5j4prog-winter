require_remote "enemy/enemy.rb"

class EnemyA < Enemy
  def initialize(x, y)
    super(100, 10, 1, x, y, Image.new(40,40).circle_fill(20,20,10, [255,255,255])) #hp, ダメージを定義
  end

  def update
    self.x += 1
  end
end