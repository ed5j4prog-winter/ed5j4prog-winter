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
  end
end