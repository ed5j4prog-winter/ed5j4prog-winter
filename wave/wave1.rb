require_remote "wave/wave.rb"
require_remote "wave/wave2.rb"
require_remote "enemy/enemyA.rb"

class Wave1 < Wave
  def initialize(game)
    super(5 * 60, Wave2.new(game), game, false)
    @game = game
    start()
  end

  def start
    p "Enter Wave 1"
  end
 
  def update
    super
    if(@time == 1)
      @game.add_enemy(EnemyA.new(0, 240))
    end
  end
end