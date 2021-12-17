class MoneyText < Sprite
  def initialize(game)
    @game = game
    image = Image.new(Window.width, Window.height)
    super(0, 0, image)
  end

  def update
    self.image = Image.new(Window.width, Window.height)
    self.image.draw_font(462, 42, "#{@game.money} 円", Font.default, [0,0,0])
    self.image.draw_font(460, 40, "#{@game.money} 円", Font.default)
  end
end