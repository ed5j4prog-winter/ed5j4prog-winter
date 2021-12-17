require_remote "wave/wave.rb"
require_remote "wave/wave7.rb"

class Wave6 < Wave
  def initialize(game)
    super(20 * 60, Wave7.new(game), game, false)
    @game = game
  end

  def start
    p "Enter Wave 6"
  end

  def update
    super
    if(@time == 1)
      for i in 0..2 do
        @game.add_enemy(EnemyD.new(rand(0..100), rand(0..100)))
        @game.add_enemy(EnemyD.new(rand(280..360), 0))
        @game.add_enemy(EnemyD.new(rand(540..640), rand(0..100)))
      end
    end
    if(@time == 10 * 60)
      for i in 0..2 do
        @game.add_enemy(EnemyD.new(rand(0..100), rand(380..480)))
        @game.add_enemy(EnemyD.new(rand(280..360), 480))
        @game.add_enemy(EnemyD.new(rand(540..640), rand(380..480)))
      end
    end
  end
end