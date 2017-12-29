class Door
  def initialize(window, x, y)
    @window = window
    @position_x = x
    @position_y = y
    @door = Gosu::Image.new("media/door_6.png")
  end

  def door_6_6
    @door = Gosu::Image.new("media/door_6.png")
  end

  def door_5_6
    @door = Gosu::Image.new("media/door_5.png")
  end

  def door_4_6
    @door = Gosu::Image.new("media/door_4.png")
  end

  def door_3_6
    @door = Gosu::Image.new("media/door_3.png")
  end

  def door_2_6
    @door = Gosu::Image.new("media/door_2.png")
  end

  def door_1_6
    @door = Gosu::Image.new("media/door_1.png")
  end

  def door_0_6
    @door = Gosu::Image.new("media/door_0.png")
  end

  def check_pattern(pattern)
    if pattern.include? ' '
      space_count = pattern.count(' ')
      door_5_6 if space_count == 1
      door_4_6 if space_count == 2
      door_3_6 if space_count == 3
      door_2_6 if space_count == 4
      door_1_6 if space_count == 5
    else
      door_6_6
    end
  end

  def draw
    @door.draw(@position_x, @position_y, 1)
  end
end
