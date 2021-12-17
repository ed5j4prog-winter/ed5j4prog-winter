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
    @money = 100
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
  
  def game_clear
    @game_clear = true
  end

  def check(arr1, arr2, r)

  end

  def check(arr1, arr2)
    arr1.each do |obj1|
      arr2.each do |obj2|
        dx = obj1.x - obj2.x
        dy = obj1.y - obj2.y
        d = dx * dx + dy * dy
        r = obj1.collision[2] + obj2.collision[2]
        if(d <= r * r)
          obj1.shot(obj2) if defined? obj1.shot
          obj2.hit(obj1) if defined? obj2.hit
        end
      end
    end
  end

  def egg_check(egg, r)
    @enemies.each do |enemy|
      dx = 320 - enemy.x
      dy = 240 - enemy.y
      d = dx * dx + dy * dy
      if(d <= r * r)
        enemy.shot(egg)
      end
    end
  end

  def run
    background = Sprite.new(
      0, 0,
      Image.new(Window.width, Window.height)
        .fill([0 ,204 ,255])
        .circle_fill(Window.width / 2, Window.height / 2, 100, [0, 128, 0])
        .circle_fill(Window.width / 2, Window.height / 2, 30, [128, 128, 0])
    )
    egg = Egg.new(self)
    p egg.x
    p egg.y
    @defenders.push(egg)
    add_object(EggHPBar.new(egg))
    sprites = [background, @bullets, @enemies, @defenders, @objects]
    Window.loop do
      if !@game_over && !@game_clear
        check(@enemies, @defenders)
        check(@bullets, @enemies)
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
        if sp.is_a?(Array)
          sp.each do |s|
            Window.draw_rot(s.x,s.y,s.image,s.angle) if !defined? s.offset
            Window.draw_rot(s.x + s.offset[:x],s.y + s.offset[:y],s.image,s.angle) if defined? s.offset
          end
        else
          Window.draw_rot(sp.x,sp.y,sp.image,sp.angle)
        end
      end
      if @game_over
        Window.draw_font(222, 362, "ゲームオーバー...", Font.default, {color: [0, 0, 0]})
        Window.draw_font(220, 360, "ゲームオーバー...", Font.default)
      end
      if @game_clear
        Window.draw_font(222, 362, "ゲームクリアー！！", Font.default, {color: [0, 0, 0]})
        Window.draw_font(220, 360, "ゲームクリアー！！", Font.default)
      end
    end
  end
end

Window.load_resources do
  Window.bgcolor = C_BLACK
  game = Game.new
  game.run()
end
