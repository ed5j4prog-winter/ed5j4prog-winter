require_remote "wave/wave.rb"
require_remote "wave/wave4.rb"

class Wave3 < Wave
  def initialize(game)
    super(20 * 60, Wave4.new(game), game, false)
    @game = game
  end

  def start
    p "Enter Wave 3"
  end

  def update
    super
    if(@time == 1)
      for i in 0..9 do
        @game.add_enemy(EnemyA.new(rand(540..640), rand(0..100)))
        if i % 2 == 0
            @game.add_enemy(EnemyB.new(rand(280..360), 0))
        end
        @game.add_enemy(EnemyA.new(rand(540..640), rand(0..100)))
      end
    end
  end
end