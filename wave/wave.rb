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
  end
end