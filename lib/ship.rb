class Ship < Struct.new :size , :row , :col , :direction
  def coords
    size.times.map { |num| direction == :down ? [row + num, col] : [row, col + num] }
  end

  def validate!(board_size)
    raise "direction must be :down or :across" unless [:down, :across].include? direction
    raise "row or col out of bounds" unless [row, col].all? { |num| (0..board_size-size).include? num }
  end
end
