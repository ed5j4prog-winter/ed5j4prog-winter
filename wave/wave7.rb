require_remote "wave/wave.rb"
require_remote "wave/wave8.rb"

class Wave7 < Wave
  def initialize(game)
    super(20 * 60, Wave8.new(game), game, false)
    @game = game
  end

  def start
    p "Enter Wave 7"
  end

  def update
    super
    if(@time == 1)
      for i in 0..4 do
        @game.add_enemy(EnemyE.new(rand(280..360), 0))
        @game.add_enemy(EnemyE.new(rand(280..360), 480))
        @game.add_enemy(EnemyE.new(0, rand(200..280)))
        @game.add_enemy(EnemyE.new(640, rand(200..280)))
      end
    end
  end
end