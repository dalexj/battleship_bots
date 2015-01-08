require 'minitest/autorun'
require 'minitest/pride'
require './lib/map'

class MapTest < MiniTest::Test
  def setup
    @map = Map.new(10)
  end

  def test_
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
