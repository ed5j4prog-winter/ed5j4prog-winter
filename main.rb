require 'dxopal'
require_remote "defenderA.rb"
require_remote "enemyA.rb"
require_remote "enemyB.rb"
require_remote "enemyC.rb"
require_remote "enemyD.rb"
require_remote "enemyE.rb"
require_remote "enemyG.rb"
require_remote "bulletA.rb"
require_remote "enemy.rb"
require_remote "bullet.rb"
include DXOpal

class Game
  def initialize
    @bullets = []
    @enemies = []
    @defenders = []
  end

  def get_items
    ret = []
    ret.push(Sprite.new(0, 0, Image.new(640, 480).circle_fill(Window.width / 2, Window.height / 2, 50, [255, 255, 255])))
    ret
  end

  def add_bullet(bullet)
    @bullets.push(bullet)
  end
  
  def add_enemy(enemy)
    @enemies.push(enemy)
  end

  def run
    objects = get_items
    @enemies.push(EnemyD.new(0, 240, self))
    sprites = [@bullets, @enemies, @defenders, objects]
    @defenders.push(DefenderA.new(200, 240, self))
    Window.loop do
      # [TODO]マウスを用いてdefenderを配置する処理

      Sprite.check(@enemies, @defenders)
      Sprite.check(@enemies, @bullets)
      Sprite.update(@enemies)
      Sprite.update(@bullets)
      Sprite.update(@defenders)
      Sprite.update(objects)
      Sprite.draw(sprites)
    end
  end
end

Window.load_resources do
  Window.bgcolor = C_BLACK
  game = Game.new
  game.run()
end
