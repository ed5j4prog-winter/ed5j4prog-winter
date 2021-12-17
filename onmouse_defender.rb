require 'dxopal'
require_remote 'defender/defenderA.rb'
require_remote 'defender/defenderB.rb'
require_remote 'defender/defenderC.rb'
require_remote 'defender/defenderD.rb'
require_remote 'defender/defenderE.rb'
require_remote 'defender/defenderF.rb'
require_remote 'defender/defenderG.rb'
require_remote 'defender/defenderH.rb'
class OnMouceDefender < Sprite
  INNER_RANGE = 30
  OUTER_RANGE = 100

  def initialize(x, y, name, image, game)
    super(x, y, image)
    @width = image.width 
    @height = image.height
    @name = name
    @game = game
  end

  def update
    self.x = Input.mouse_pos_x
    self.y = Input.mouse_pos_y 
    if(Input.mouse_push?(M_LBUTTON))
      create_object() if inrange?
    end
    if(Input.mouse_push?(M_MBUTTON))
      self.vanish
    end
  end

  def create_object
    x = self.x
    y = self.y
    case @name
    when "DefenderA"
      @game.add_defender(DefenderA.new(x, y, @game))
    when "DefenderB"
      @game.add_defender(DefenderB.new(x, y, @game))
    when "DefenderC"
      @game.add_defender(DefenderC.new(x, y, @game))
    when "DefenderD"
      @game.add_defender(DefenderD.new(x, y, @game))
    when "DefenderE"
      @game.add_defender(DefenderE.new(x, y, @game))
    when "DefenderF"
      @game.add_defender(DefenderF.new(x, y, @game))
    when "DefenderG"
      @game.add_defender(DefenderG.new(x, y, @game))
    when "DefenderH"
      @game.add_defender(DefenderH.new(x, y, @game))
    else
      p "#{@name} is undefined defender."
    end
  end

  def inrange?
    dx = Window.width / 2 - Input.mouse_pos_x
    dy = Window.height / 2 - Input.mouse_pos_y
    dx * dx + dy * dy <= OUTER_RANGE * OUTER_RANGE &&
    dx * dx + dy * dy > INNER_RANGE * INNER_RANGE
  end

  def offset
    {x: -25, y: -20}
  end
end