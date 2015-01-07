class SampleBot < Bot::Base
  def place_ships
    place_battleship row: 4, col: 3, direction: :down
    place_carrier    row: 4, col: 4, direction: :down
    place_cruiser    row: 4, col: 5, direction: :down
    place_submarine  row: 4, col: 6, direction: :down
    place_destroyer  row: 4, col: 7, direction: :down
  end

  def take_turn(board)
    row, col = rand(10), rand(10)
    until board[row][col] == Map::EMPTY_MARK
      row, col = rand(10), rand(10)
    end
    take_guess [row, col]
  end
end
