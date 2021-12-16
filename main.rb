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
require_remote "egg.rb"
require_remote "egg_hp_bar.rb"
require_remote "money_text.rb"
include DXOpal

class Game
  attr_reader :money
  def initialize
    @bullets = []
    @enemies = []
    @defenders = []
    @objects = init_objects
    @game_over = false
    @money = 10000
  end

  def init_objects
    ret = []

    # ドラッグドロップするUI
    ret.push(
      PlacementUI.new(self)
    )
    


    # ウェーブ
    ret.push(
      Wave1.new(self)
    )

    # 金
    ret.push(
      MoneyText.new(self)
    )
    ret
  end

  def add_bullet(bullet)
    @bullets.push(bullet)
  end
  
  def add_enemy(enemy)
    @enemies.push(enemy)
  end

  def add_object(object)
    @objects.push(object)
  end

  def add_defender(defender)
    @defenders.push(defender) if use_money(defender.cost)
  end
  
  def add_enemy(enemy)
    @enemies.push(enemy)
  end

  def use_money(money)
    return false if @money < money
    @money -= money
    true
  end

  def get_money(money)
    @money += money
  end

  def game_over
    @game_over = true
  end

  def run
    background = Sprite.new(
      0, 0,
      Image.new(Window.width, Window.height)
        .fill([0, 120, 161])
        .circle_fill(Window.width / 2, Window.height / 2, 100, [0, 150, 161])
        .circle_fill(Window.width / 2, Window.height / 2, 30, [0, 120, 161])
    )
    egg = Egg.new(self)
    @defenders.push(egg)
    add_object(EggHPBar.new(egg))
    sprites = [background, @bullets, @enemies, @defenders, @objects]
    Window.loop do
      if !@game_over
        Sprite.check(@enemies, @defenders)
        Sprite.check(@bullets, @enemies)
        Sprite.update(@enemies)
        Sprite.update(@bullets)
        Sprite.update(@defenders)
        Sprite.update(@objects)
        for enemy in @enemies do
          get_money(enemy.drop) if enemy.vanished?
        end
        Sprite.clean(@enemies)
        Sprite.clean(@bullets)
        Sprite.clean(@defenders)
        Sprite.clean(@objects)
      end
      sprites.each do |sp|
          sp.each do |s|
              Window.draw_rot(s.x,s.y,s.image,s.angle)
          end
      end
      if @game_over
        Window.draw_font(200, 180, "ゲームオーバー...", Font.default)
      end
    end
  end
end

Window.load_resources do
  Window.bgcolor = C_BLACK
  game = Game.new
  game.run()
end
