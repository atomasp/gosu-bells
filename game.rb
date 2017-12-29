require "rubygems"
require "gosu"
require_relative "lib/bell"
require_relative "lib/door"

BELLS = [
  "media/do.wav",
  "media/re.wav",
  "media/mi.wav",
  "media/fa.wav",
  "media/sol.wav"
]

class Game < Gosu::Window
  def initialize
    super 800, 600
    self.caption = "Juego de las campanas"
    @background_image = Gosu::Image.new("media/bg.png", :tileable => true)
    @bells = Array.new
    BELLS.each_with_index do |tone, index|
      position_x = ((self.width / BELLS.size) * index) + 30
      @bells << Bell.new(self, position_x, 465, Gosu::Sample.new(tone))
    end
    @door = Door.new(self, 0, 0)
  end

  def update
  end

  def draw
    @background_image.draw(0, 0, 0)
    @bells.each do |bell| 
      bell.draw
    end
    @door.draw
  end  
end

window = Game.new
window.show
