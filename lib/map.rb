require_relative 'ship'

class Map
  EMPTY_MARK = "."
  HIT_MARK   = "X"
  MISS_MARK  = "M"
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

  def place_ship(size: , row: , col: , direction: )
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
      board[row][col] = HIT_MARK
    end
  end

  def guess(row, col)
    raise "Guess not in bounds" unless [row, col].all? { |num| (0...board_size).include?(num) }
    raise "You can't guess a spot you already have" unless board[row][col] == EMPTY_MARK
    board[row][col] = ships_coords.include?([row, col]) ? HIT_MARK : MISS_MARK
  end

  def guess_with_string(coords) # B4
    raise "Invalid format for guess, must be like 'A5'" unless coords =~ /\A[a-z]\d\z/i
    guess(coords[0].upcase.ord - 65, coords[1].to_i - 1)
  end

  private
  def header
    ". " + (1..board_size).to_a.join(" ") + "\n"
  end

  def body
    board.map.with_index { |row, index| (index + 65).chr + " " + row.join(" ") }.join("\n")
  end
end

map = Map.new(10)
map.place_ship(size: 8, direction: :across, row: 0, col: 0)
map.place_ship(size: 4, direction: :down, row: 5, col: 5)
map.place_ship(size: 2, direction: :across, row: 3, col: 6)

map.guess_with_string "B4"
map.guess_with_string "C7"
map.guess_with_string "D7"
map.guess_with_string "D8"


puts map

# ~> RuntimeError
# ~> row or col out of bounds
# ~>
# ~> /Users/alex/turing/projects/dsa_battleship/lib/map.rb:25:in `place_ship'
# ~> /Users/alex/turing/projects/dsa_battleship/lib/map.rb:66:in `<main>'
