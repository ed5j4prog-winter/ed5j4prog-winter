require 'dxopal'
require_remote 'onmouse_defender.rb'

Image.register(:defender0, 'images/Defender/Defender_00.png')
Image.register(:defender1, 'images/Defender/Defender_01.png')
Image.register(:defender2, 'images/Defender/Defender_02.png')
Image.register(:defender3, 'images/Defender/Defender_03.png')
Image.register(:defender4, 'images/Defender/Defender_04.png')
Image.register(:defender5, 'images/Defender/Defender_05.png')
Image.register(:defender6, 'images/Defender/Defender_06.png')
Image.register(:defender7, 'images/Defender/Defender_07.png')

class PlacementUI < Sprite
  WIDTH = 80
  NUM_VERTICAL = 4
  LINE_COLOR = [20, 155, 20]
  BACK_COLOR = [100, 100, 100]
  def initialize(game)
    @game = game
    @defenders = [
      ["DefenderA", Image[:defender0]],
      ["DefenderB", Image[:defender1]],
      ["DefenderC", Image[:defender2]],
      ["DefenderD", Image[:defender3]],
      ["DefenderE", Image[:defender4]],
      ["DefenderF", Image[:defender5]],
      ["DefenderG", Image[:defender6]],
      ["DefenderH", Image[:defender7]],
    ]
    img = init_apperance

    super(0, 0, img)
  end

  def init_apperance
    w = Window.width
    h = Window.height

    img = Image.new(w, h)
    img.box_fill(0, 0, WIDTH, h, BACK_COLOR)
    img.box_fill(w, 0, w - WIDTH, h, BACK_COLOR)
    img.line(WIDTH, 0, WIDTH, h, LINE_COLOR)
    img.line(w - WIDTH, 0, w - WIDTH, h, LINE_COLOR)

    (NUM_VERTICAL - 1).times do |i|
      y = h * (i + 1) / NUM_VERTICAL
      img.line(0, y, WIDTH, y, LINE_COLOR)
      img.line(w, y, w - WIDTH, y, LINE_COLOR)
    end

    @defenders.each_with_index do |defender, i|
      image = defender[1]
      x = WIDTH / 2 if i < NUM_VERTICAL
      x = w - WIDTH / 2 if i >= NUM_VERTICAL
      y = (i % NUM_VERTICAL) * h / NUM_VERTICAL + h / NUM_VERTICAL / 2
      img.draw(x - image.width / 2, y - image.height / 2, image)
    end
    img
  end

  def update
    if(Input.mouse_release?(M_LBUTTON))
      x = Input.mouse_pos_x
      y = Input.mouse_pos_y
      index = get_index(x, y)
      return if index == -1
      @game.add_object(OnMouceDefender.new(x, y, @defenders[index][0], @defenders[index][1], @game))
    end
  end

  def get_index(x, y)
    if(x <= WIDTH)
      return y / (Window.height / NUM_VERTICAL)
    elsif(x >= Window.width - WIDTH)
      return y / (Window.height / NUM_VERTICAL) + NUM_VERTICAL
    end
    -1
  end
end