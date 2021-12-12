require_remote "wave/wave.rb"

class Wave2 < Wave
  def initialize(game)
    super(5 * 60, nil, game, true)
    @game = game
  end

  def start
    p "Enter Wave 2"
  end

  def update
    super
    if(@time % 60 == 1)
      @game.add_enemy(EnemyA.new(0, 240))
    end
  end
end