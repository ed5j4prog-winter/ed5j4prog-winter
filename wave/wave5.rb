require_remote "wave/wave.rb"
require_remote "wave/wave6.rb"

class Wave5 < Wave
  def initialize(game)
    super(20 * 60, Wave6.new(game), game, false)
    @game = game
  end

  def start
    p "Enter Wave 5"
  end

  def update
    super
    if(@time == 1)
      for i in 0..9 do
        @game.add_enemy(EnemyB.new(rand(280..360), 0))
        @game.add_enemy(EnemyB.new(rand(280..360), 480))
        @game.add_enemy(EnemyB.new(0, rand(200..280)))
        @game.add_enemy(EnemyB.new(640, rand(200..280)))
      end
    end
  end
end