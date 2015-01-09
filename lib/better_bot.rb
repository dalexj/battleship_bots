class BetterBot
  def place_ships(map_generator)
    until map_generator.valid_placements?
      map_generator.place_battleship row: rand(10), col: rand(10), direction: [:down, :across].sample
      map_generator.place_carrier    row: rand(10), col: rand(10), direction: [:down, :across].sample
      map_generator.place_cruiser    row: rand(10), col: rand(10), direction: [:down, :across].sample
      map_generator.place_submarine  row: rand(10), col: rand(10), direction: [:down, :across].sample
      map_generator.place_destroyer  row: rand(10), col: rand(10), direction: [:down, :across].sample
    end
  end

  def take_turn(board)
    hits = board.flatten.each_index.select{ |i| board.flatten[i] == Map::HIT_MARK }
    hits.each do |hit|
      row, col = hit.divmod(10)
      next if all_marked_around?(row, col, board)
      [[row, col + 1], [row, col - 1],
      [row - 1, col], [row + 1, col]].each do |rrow, ccol|
        return [rrow, ccol] if within_range?(rrow, ccol) && board[rrow][ccol] == Map::EMPTY_MARK
      end
    end
    rand_shot(board)
  end

  def rand_shot(board)
    row, col = rand(10), rand(10)
    until (row + col).even? && board[row][col] == Map::EMPTY_MARK
      row, col = rand(10), rand(10)
    end
    [row, col]
  end

  def within_range?(*args)
    args.all? { |num| (0..9).include? num }
  end

  def all_marked_around?(row, col, board)
    [[row, col + 1], [row, col - 1],
    [row - 1, col], [row + 1, col]].none? do |rrow, ccol|
      !within_range?(rrow, ccol) || board[rrow][ccol] == Map::EMPTY_MARK
    end
  end
end
