require 'dxopal'
require_remote "defender/defenderA.rb"
require_remote "enemy/enemyA.rb"
require_remote "enemy/enemyB.rb"
require_remote "enemy/enemyC.rb"
require_remote "enemy/enemyD.rb"
require_remote "enemy/enemyE.rb"
require_remote "enemy/enemyG.rb"
require_remote "placement_ui.rb"
require_remote "wave/wave1.rb"
include DXOpal

Image.register(:egg, 'images/Egg/Egg_00.png')

class Game
  def initialize
    @bullets = []
    @enemies = []
    @defenders = []
    @objects = init_objects
  end

  def init_objects
    ret = []

    # ドラッグドロップするUI
    ret.push(
      PlacementUI.new(self)
    )

    # 巣
    ret.push(
      Sprite.new(
        Window.width / 2 - 50, Window.height / 2 - 50,
        Image[:egg]
      )
    )

    # ウェーブ
    ret.push(
      Wave1.new(self)
    )
    ret
  end

  def add_bullet(bullet)
    @bullets.push(bullet)
  end

  def add_object(object)
    @objects.push(object)
  end

  def add_defender(defender)
    @defenders.push(defender)
  end
  
  def add_enemy(enemy)
    @enemies.push(enemy)
  end

  def run
    background = Sprite.new(
      0, 0,
      Image.new(Window.width, Window.height)
        .fill([0, 120, 161])
        .circle_fill(Window.width / 2, Window.height / 2, 100, [0, 150, 161])
        .circle_fill(Window.width / 2, Window.height / 2, 30, [0, 120, 161])
    )
    sprites = [background, @bullets, @enemies, @defenders, @objects]
    Window.loop do
      Sprite.check(@enemies, @defenders)
      Sprite.check(@enemies, @bullets)
      Sprite.update(@enemies)
      Sprite.update(@bullets)
      Sprite.update(@defenders)
      Sprite.update(@objects)
      Sprite.draw(sprites)
    end
  end
end

Window.load_resources do
  Window.bgcolor = C_BLACK
  game = Game.new
  game.run()
end
