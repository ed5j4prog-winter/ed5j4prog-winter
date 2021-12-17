class Wave < Sprite
  # def initialize
  def initialize(duration, nextwave, game, lastwave)
    @duration = duration
    @nextwave = nextwave
    @time = 0
    @lastwave = lastwave
    super(0, 0, Image.new(1, 1))
  end

  def update
    @time += 1
    if(@duration == @time && !@lastwave)
      @game.add_object(@nextwave)
      @nextwave.start
      self.vanish
    end
    self.image = Image.new(Window.width, Window.height)
    text = self.class.name.split("::")[1]
    self.image.draw_font(102, 42, "#{text}", Font.default, [0,0,0])
    self.image.draw_font(100, 40, "#{text}", Font.default)
  end
end