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
  INNER_RANGE = 50
  OUTER_RANGE = 100

  def initialize(x, y, name, image, game)
    super(x, y, image)
    @width = image.width 
    @height = image.height
    @name = name
    @game = game
  end

  def update
    self.x = Input.mouse_pos_x - @width / 2
    self.y = Input.mouse_pos_y - @height / 2
    if(Input.mouse_push?(M_LBUTTON))
      create_object() if inrange?
    end
    if(Input.mouse_push?(M_MBUTTON))
      self.vanish
    end
  end

  def create_object
    case @name
    when "DefenderA"
      @game.add_defender(DefenderA.new(Input.mouse_pos_x + @width, Input.mouse_pos_y + @height, @game))
    when "DefenderB"
      @game.add_defender(DefenderB.new(Input.mouse_pos_x + @width, Input.mouse_pos_y + @height, @game))
    when "DefenderC"
      @game.add_defender(DefenderC.new(Input.mouse_pos_x + @width, Input.mouse_pos_y + @height, @game))
    when "DefenderD"
      @game.add_defender(DefenderD.new(Input.mouse_pos_x + @width, Input.mouse_pos_y + @height, @game))
    when "DefenderE"
      @game.add_defender(DefenderE.new(Input.mouse_pos_x + @width, Input.mouse_pos_y + @height, @game))
    when "DefenderF"
      @game.add_defender(DefenderF.new(Input.mouse_pos_x + @width, Input.mouse_pos_y + @height, @game))
    when "DefenderG"
      @game.add_defender(DefenderG.new(Input.mouse_pos_x + @width, Input.mouse_pos_y + @height, @game))
    when "DefenderH"
      @game.add_defender(DefenderH.new(Input.mouse_pos_x + @width, Input.mouse_pos_y + @height, @game))
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
end