class EggHPBar < Sprite
  HEIGHT = 4
  B_BORDER = 2
  W_BORDER = 1
  LEFT = 120
  TOP = 20
  WIDTH = Window.width - LEFT * 2 - B_BORDER - W_BORDER * 2

  def initialize(egg)
    img = Image.new(Window.width, Window.height)
    super(0, 0, img)
    @egg = egg
  end

  def update
    black = [0, 0, 0]
    white = [200, 200, 200]
    green = [50, 211, 166]
    self.image.clear
    x1 = LEFT
    y1 = TOP
    x2 = x1 + WIDTH + B_BORDER + W_BORDER * 2
    y2 = y1 + HEIGHT + B_BORDER * 2 + W_BORDER * 2
    self.image.box_fill(x1, y1, x2, y2, white)
    x1 += W_BORDER
    x2 = x1 + @egg.get_hp_rate * WIDTH + B_BORDER
    y1 += W_BORDER
    y2 -= W_BORDER
    self.image.box_fill(x1, y1, x2, y2, black)
    x1 += B_BORDER
    x2 -= B_BORDER
    y1 += B_BORDER
    y2 -= B_BORDER
    self.image.box_fill(x1, y1, x2, y2, green)
    x1 = x2
    x2 = LEFT + WIDTH + W_BORDER + B_BORDER
    self.image.box_fill(x1, y1, x2, y2, black)
  end
end