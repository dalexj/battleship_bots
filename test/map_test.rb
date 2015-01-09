require 'minitest/autorun'
require 'minitest/pride'
require './lib/map'

class MapTest < MiniTest::Test
  attr_reader :map
  def setup
    @map = Map.new(10)
    map.to_s # make simplecov happy
  end

  def test_dup_board_wont_affect_board
    board = map.dup_board
    board[6] = "asdasdasdasd"
    refute_equal map.board, board
  end

  def test_throws_error_when_ships_overlap
    map.place_ship size: 5, row: 0, col: 4, direction: :down
    map.place_ship size: 5, row: 5, col: 0, direction: :across
    assert_raises RuntimeError do
      map.place_ship size: 5, row: 4, col: 0, direction: :across
    end
  end
end

# map = Map.new(10)
# map.place_ship({size:20, direction: :across, row: 0, col: 0}.merge({size: 4}))
# map.place_ship(size: 4, direction: :down, row: 5, col: 5)
# map.place_ship(size: 2, direction: :across, row: 3, col: 6)
#
# map.guess_with_string "B4"
# map.guess_with_string "C7"
# map.guess_with_string "D7"
# map.guess_with_string "D8"
#
# map.lol
#
# puts map
