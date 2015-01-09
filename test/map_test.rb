require_relative 'test_helper'
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

  def test_marks_spots_where_ships_are
    map.place_ship size: 5, row: 0, col: 4, direction: :down
    map.mark_with_ships
    5.times do |n|
      assert_equal Map::SHIP_MARK, map.board[n][4]
    end
  end

  def test_map_knows_when_game_lost
    map.place_ship size: 5, row: 0, col: 4, direction: :down
    5.times do |n|
      refute map.lost?
      map.fire! Shot.new [n, 4]
    end
    assert map.lost?
  end

  def test_map_cant_shoot_same_spot_twice
    [[0, 0], [1, 8], [0, 4]].each do |array|
      map.fire! Shot.new array
      assert_raises RuntimeError do
        map.fire! Shot.new array
      end
    end
  end
end
