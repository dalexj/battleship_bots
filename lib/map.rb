require_relative 'ship'

class Map
  EMPTY_MARK = "."
  HIT_MARK   = "X"
  MISS_MARK  = "m"
  SHIP_MARK  = "S"
  attr_accessor :board_size, :board, :ships

  def initialize(board_size)
    @board_size = board_size
    @board = Array.new(board_size) { Array.new(board_size) {EMPTY_MARK} }
    @ships = []
  end

  def dup_board
    board.map(&:dup)
  end

  def to_s
    header + body
  end

  def place_ship(options)
    size,row,col,direction = options[:size] , options[:row] , options[:col] , options[:direction]
    raise "direction must be :down or :across" unless [:down, :across].include? direction
    raise "row or col out of bounds" unless [row, col].all? { |num| (0..board_size-size).include? num }
    new_ship = Ship.new(size , row , col , direction)
    raise "You cannot overlap ships" if (ships_coords & new_ship.coords).any?
    ships << new_ship
  end

  def ships_coords
    ships.flat_map(&:coords)
  end

  def lol
    ships_coords.each do |row, col|
      board[row][col] = SHIP_MARK
    end
  end

  def fire!(shot)
    raise "Guess not in bounds" unless shot.in_bounds?(board_size)
    raise "You can't guess a spot you already have" unless mark_at(shot) == EMPTY_MARK
    mark shot, ships_coords.include?(shot.to_coords) ? HIT_MARK : MISS_MARK
  end

  def mark_at(shot)
    row, col = shot.to_coords
    board[row][col]
  end

  def mark(shot, mark)
    row, col = shot.to_coords
    board[row][col] = mark
  end

  def lost?
    ships_coords.all? { |row, col| board[row][col] == HIT_MARK }
  end

  private
  def header
    ". " + (1..board_size).to_a.join(" ") + "\n"
  end

  def body
    board.map.with_index { |row, index| (index + 65).chr + " " + row.join(" ") }.join("\n")
  end
end
