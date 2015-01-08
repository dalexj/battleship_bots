require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < MiniTest::Test
  def setup
    @ship_across = Ship.new(5, 2, 5, :across)
    @ship_down =   Ship.new(4, 2, 5, :down)
  end

  def test_gives_coordinates
    across = [[2, 5], [2, 6], [2, 7], [2, 8], [2, 9]]
    down   = [[2, 5], [3, 5], [4, 5], [5, 5]]
    assert_equal @ship_across.coords, across
    assert_equal @ship_down.coords,   down
  end

  def test_validates_direction
    Ship.new(1, 1, 1, :across).validate!(10)
    Ship.new(1, 1, 1, :down).validate!(10)
    [:fake, :downn, :aacross].each do |direction|
      assert_raises RuntimeError do
        Ship.new(1, 1, 1, direction).validate!(10)
      end
    end
  end

  def test_validates_in_bounds
    Ship.new(1, 9, 9, :across).validate!(10)
    Ship.new(1, 0, 0, :down).validate!(10)
    assert_raises RuntimeError do
      Ship.new(1, -1, 1, :across).validate!(10)
    end
    assert_raises RuntimeError do
      Ship.new(1, 1, 10, :across).validate!(10)
    end
  end

  def test_validates_in_bounds_if_ship_would_extend_out
    Ship.new(1, 1, 1, :across).validate!(10)
    Ship.new(1, 1, 1, :down).validate!(10)
    [:fake, :downn, :aacross].each do |direction|
      assert_raises RuntimeError do
        Ship.new(1, 1, 1, direction).validate!(10)
      end
    end
  end
end
