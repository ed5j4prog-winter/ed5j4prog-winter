require 'dxopal'
require_remote "defender/defenderA.rb"
require_remote "enemy/enemyA.rb"
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

  def run
    objects = get_items
    @enemies.push(EnemyA.new(0, 240))
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
