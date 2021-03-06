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

PATTERN = '333333351234444433355421'

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
    @bell_clicked = nil
    @trigger = false
    @start_time = 0
    @pattern_clicked = ''
  end

  def update
    if @trigger
      if Gosu.milliseconds - @start_time < 100
        @bell_clicked.click
        if PATTERN.start_with? @pattern_clicked
          if PATTERN == @pattern_clicked
            @door.door_0_6
          else
            @door.check_pattern(PATTERN, @pattern_clicked)
          end
        else
          @pattern_clicked = ''
        end
      else
        @bells.each { |b| b.unclick }
        @trigger = false
      end
    end
  end

  def button_down(key)
    @start_time = Gosu.milliseconds
    @trigger = true
    case key
    when Gosu::Kb1
      @bell_clicked = @bells[0]
      @pattern_clicked += '1'
    when Gosu::Kb2
      @bell_clicked = @bells[1]
      @pattern_clicked += '2'
    when Gosu::Kb3
      @bell_clicked = @bells[2]
      @pattern_clicked += '3'
    when Gosu::Kb4
      @bell_clicked = @bells[3]
      @pattern_clicked += '4'
    when Gosu::Kb5
      @bell_clicked = @bells[4]
      @pattern_clicked += '5'
    when Gosu::KbEscape
      @trigger = false
      close
    else
      @trigger = false
      super
    end
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
