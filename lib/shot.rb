class Shot
  def initialize(coords)
    @row, @col = coords
  end

  def to_coords
    [@row, @col]
  end

  def in_bounds?(board_size)
    to_coords.all? { |num| (0...board_size).include?(num) }
  end

  # def guess_with_string(coords) # B4
  #   raise "Invalid format for guess, must be like 'A5'" unless coords =~ /\A[a-z]\d\z/i
  #   guess(coords[0].upcase.ord - 65, coords[1].to_i - 1)
  # end
end
