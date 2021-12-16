require_remote "wave/wave.rb"
require_remote "wave/wave2.rb"
require_remote "enemy/enemyA.rb"

class Wave1 < Wave
  def initialize(game)
    super(20 * 60, Wave2.new(game), game, false)
    @game = game
    start()
  end

  def start
    p "Enter Wave 1"
  end
 
  def update
    super
    if(@time == 1)
      for i in 0..9 do
        @game.add_enemy(EnemyA.new(rand(0..100), rand(0..100)))
      end
    end
  end
end