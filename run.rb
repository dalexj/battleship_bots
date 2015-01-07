require_relative 'lib/engine'
require 'gosu'

class GUI < Gosu::Window
  attr_reader :engine
  def initialize
    super(1000, 500, false)
    self.caption = "Battleships"
    @engine = BattleshipEngine.new(SampleBot, SampleBot)
    engine.start_game
    @font = Gosu::Font.new(self, "courier", 36)
    @count = 0
    @background = 0xFFF9CDAD
  end

  def update
    @count += 1
    if (@count % 100).zero?
      @engine.take_turn unless @engine.game_over?
      @count += 0
    end
  end

  def draw
    draw_background
    @font.draw("Player 1", 100, 10, 1, 1, 1, 0xFFFE4365)
    @font.draw("Player 2", 600, 10, 1, 1, 1, 0xFFFE4365)
    @engine.map_1.to_s.split("\n").each_with_index do |text, index|
      @font.draw(text, 50, 50 + (36*index), 1, 1, 1, 0xFFFE4365)
    end
    @engine.map_2.to_s.split("\n").each_with_index do |text, index|
      @font.draw(text, 550, 50 + (36*index), 1, 1, 1, 0xFFFE4365)
    end
  end

  def draw_background
    draw_quad(0, 0, @background, 0, 1050, @background, 1050, 0, @background, 1050, 1050,  @background)
  end

  def rectangle(x, y, width, height)
    draw_quad(x, y, @background, x, height + y, @background, width + x, y, @background, width + x, height + y,  @background)
  end

  def needs_cursor?
    true
  end
end


# GUI.new.show

engine = BattleshipEngine.new(SampleBot, SampleBot)
engine.start_game
engine.print_boards_with_ship_locs
engine.take_turn
# engine.print_boards
engine.play_fully
