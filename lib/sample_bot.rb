require_relative 'shot'

class SampleBot
  def place_ships(map_generator)
    map_generator.place_battleship row: 1, col: 0, direction: :down
    map_generator.place_carrier    row: 0, col: 1, direction: :across
    map_generator.place_cruiser    row: 4, col: 5, direction: :down
    map_generator.place_submarine  row: 4, col: 6, direction: :down
    map_generator.place_destroyer  row: 4, col: 8, direction: :across
  end

  def take_turn(board)
    row, col = rand(10), rand(10)
    until board[row][col] == Map::EMPTY_MARK
      row, col = rand(10), rand(10)
    end
    Shot.new row, col
  end
end
