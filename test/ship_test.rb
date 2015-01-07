require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < MiniTest::Test
  def setup
    @ship_across = Ship.new(5, 2, 5, :across)
    @ship_down =   Ship.new(5, 2, 5, :down)
  end

  def test_it_works
    across = [[2, 5], [2, 6], [2, 7], [2, 8], [2, 9]]
    down   = [[2, 5], [3, 5], [4, 5], [5, 5], [6, 5]]
    assert_equal @ship_across.coords, across
    assert_equal @ship_down.coords,   down
  end
end
