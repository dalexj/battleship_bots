require 'minitest/autorun'
require 'minitest/pride'
require './lib/shot'

class ShotTest < MiniTest::Test
  def test_knows_if_in_bounds
    assert Shot.new([0, 0]).in_bounds?(10)
    assert Shot.new([9, 9]).in_bounds?(10)
    refute Shot.new([-1, 0]).in_bounds?(10)
    refute Shot.new([10, 0]).in_bounds?(10)
    refute Shot.new([0, -1]).in_bounds?(10)
    refute Shot.new([0, 10]).in_bounds?(10)
  end
end
