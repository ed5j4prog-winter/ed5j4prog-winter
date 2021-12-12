Image.register(:egg, 'images/Egg/Egg_00.png')

class Egg < Sprite
  def initialize(game)
    @max_hp = 1000
    @hp = @max_hp
    @game = game
    super(Window.width / 2 - 50, Window.height / 2 - 50, Image[:egg])
    self.collision = [0, 0, 55]
  end

  def attack(damage)
    @hp -= damage
    if(@hp <= 0)
      @game.game_over
    end
  end

  def type
    "egg"
  end

  def get_hp_rate
    @hp.to_f / @max_hp
  end
end