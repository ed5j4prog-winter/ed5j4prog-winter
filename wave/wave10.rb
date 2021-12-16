require_remote "wave/wave.rb"

class Wave10 < Wave
  def initialize(game)
    super(20 * 60, nil, game, true)
    @game = game
  end

  def start
    p "Enter Wave 10"
  end

  def update
    super
    if(@time == 1)
      @game.add_enemy(EnemyG.new(320, 10))
    end
  end
end