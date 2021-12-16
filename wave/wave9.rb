require_remote "wave/wave.rb"
require_remote "wave/wave10.rb"

class Wave9 < Wave
  def initialize(game)
    super(20 * 60, Wave10.new(game), game, false)
    @game = game
  end

  def start
    p "Enter Wave 9"
  end

  def update
    super
    if(@time == 1)
      for i in 0..9 do
        @game.add_enemy(EnemyA.new(rand(280..360), 0))
        @game.add_enemy(EnemyB.new(rand(280..360), 480))
        @game.add_enemy(EnemyC.new(0, rand(200..280)))
        @game.add_enemy(EnemyE.new(640, rand(200..280)))
        @game.add_enemy(EnemyA.new(rand(0..100), rand(0..100)))
        @game.add_enemy(EnemyB.new(rand(540..640), rand(0..100)))
        @game.add_enemy(EnemyC.new(rand(0..100), rand(380..480)))
        @game.add_enemy(EnemyE.new(rand(540..640), rand(380..480)))
      end
    end
  end
end