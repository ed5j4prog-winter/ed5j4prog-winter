require_remote "wave/wave.rb"
require_remote "wave/wave5.rb"

class Wave4 < Wave
  def initialize(game)
    super(20 * 60, Wave5.new(game), game, false)
    @game = game
  end

  def start
    p "Enter Wave 4"
  end

  def update
    super
    if(@time == 1)
      for i in 0..9 do
        @game.add_enemy(EnemyB.new(rand(280..360), 0))
        @game.add_enemy(EnemyB.new(rand(280..360), 480))
        if i % 3 == 0
            @game.add_enemy(EnemyC.new(rand(0..100), rand(0..100)))
            @game.add_enemy(EnemyC.new(rand(540..640), rand(0..100)))
        end
      end
    end
  end
end