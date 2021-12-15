require 'dxopal'
require_remote "defender/defenderA.rb"
require_remote "enemy/enemyA.rb"
require_remote "placement_ui.rb"
include DXOpal

class Game
  def initialize
    @bullets = []
    @enemies = []
    @defenders = []
    @objects = init_objects
  end

  def init_objects
    ret = []

    # 巣
    ret.push(
      Sprite.new(
        0, 0,
        Image.new(640, 480).
        circle_fill(
          Window.width / 2, Window.height / 2,
          50, [255, 255, 255]
        )
      )
    )
    


    # ドラッグドロップするUI
    ret.push(
      PlacementUI.new(self)
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

  def run
    @enemies.push(EnemyA.new(0, 200))
    sprites = [@bullets, @enemies, @defenders, @objects]
    @defenders.push(DefenderA.new(200, 240, self))
    Window.loop do
      Sprite.check(@enemies, @defenders)
      Sprite.check(@enemies, @bullets)
      Sprite.update(@enemies)
      Sprite.update(@bullets)
      Sprite.update(@defenders)
      Sprite.update(@objects)
      Sprite.clean(@enemies)
      Sprite.clean(@defenders)
      Sprite.clean(@objects)
      Sprite.clean(@bullets)
      #Sprite.draw(sprites)
      sprites.each do |sp|
          sp.each do |s|
              Window.draw_rot(s.x,s.y,s.image,s.angle)
          end
      end
    end
  end
end

Window.load_resources do
  Window.bgcolor = C_BLACK
  game = Game.new
  game.run()
end
