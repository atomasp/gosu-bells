require "rubygems"
require "gosu"

class Game < Gosu::Window
  def initialize
    super 800, 600
    self.caption = "Juego de las campanas"
  end

  def update
  end

  def draw
  end  
end

window = Game.new
window.show
