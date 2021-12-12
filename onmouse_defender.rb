require 'dxopal'
require_remote 'defender/defenderA.rb'
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
      @game.add_defender(DefenderA.new(self.x, self.y, @game))
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