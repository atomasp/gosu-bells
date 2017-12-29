class Bell
  def initialize(window, x, y, note)
    @window = window
    @position_x = x
    @position_y = y
    @note = note
    @bell = Gosu::Image.new("media/bell.png")
  end

  def click
    @bell = Gosu::Image.new("media/bell_click.png")
    @note.play
  end

  def unclick
    @bell = Gosu::Image.new("media/bell.png")
  end

  def draw
    @bell.draw(@position_x, @position_y, 1)
  end
end
