require "rubygems"
require "gosu"

class Game < Gosu::Window
  def initialize
    super 800, 600
    self.caption = "Juego de las campanas"
    @background_image = Gosu::Image.new("media/bg.png", :tileable => true)
  end

  def update
  end

  def draw
    @background_image.draw(0, 0, 0)
  end  
end

window = Game.new
window.show
