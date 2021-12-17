require_remote "wave/wave.rb"
require_remote "wave/wave9.rb"

class Wave8 < Wave
  def initialize(game)
    super(20 * 60, Wave9.new(game), game, false)
    @game = game
  end

  def start
    p "Enter Wave 8"
  end

  def update
    super
    if(@time == 1)
      for i in 0..4 do
        @game.add_enemy(EnemyE.new(rand(0..100), rand(0..100)))
        @game.add_enemy(EnemyE.new(rand(540..640), rand(0..100)))
        @game.add_enemy(EnemyE.new(rand(0..100), rand(380..480)))
        @game.add_enemy(EnemyE.new(rand(540..640), rand(380..480)))
      end
    end
    if(@time == 10 * 60)
      for i in 0..4 do
        @game.add_enemy(EnemyD.new(rand(0..100), rand(0..100)))
        @game.add_enemy(EnemyD.new(rand(540..640), rand(0..100)))
        @game.add_enemy(EnemyD.new(rand(0..100), rand(380..480)))
        @game.add_enemy(EnemyD.new(rand(540..640), rand(380..480)))
      end
    end
  end
end