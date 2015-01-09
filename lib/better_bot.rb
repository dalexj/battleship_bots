class BetterBot
  def place_ships(map_generator)
    map_generator.place_battleship row: 1, col: 0, direction: :down
    map_generator.place_carrier    row: 0, col: 1, direction: :across
    map_generator.place_cruiser    row: 4, col: 3, direction: :down
    map_generator.place_submarine  row: 4, col: 6, direction: :down
    map_generator.place_destroyer  row: 4, col: 8, direction: :across
  end

  def take_turn(board)
    hits = board.flatten.each_index.select{ |i| board.flatten[i] == Map::HIT_MARK }
    hits.each do |hit|
      next if all_marked_around?(hit, board)
      row, col = hit.divmod(10)
      [[row, col + 1], [row, col - 1],
      [row - 1, col], [row + 1, col]].each do |rrow, ccol|
        return [rrow, ccol] if within_range?(rrow, ccol) && board[rrow][ccol] == Map::EMPTY_MARK
      end
    end
    rand_shot(board)
  end

  def rand_shot(board)
    row, col = rand(10), rand(10)
    until board[row][col] == Map::EMPTY_MARK
      row, col = rand(10), rand(10)
    end
    [row, col]
  end

  def within_range?(*args)
    args.all? { |num| (0..9).include? num }
  end

  def all_marked_around?(loc, board)
    [-1, 1, -10, 10].none? do |num|
      row, col = (loc + num).divmod(10)
      board[row][col] == Map::EMPTY_MARK
    end
  end
end
