class Ship < Struct.new :size , :row , :col , :direction
  def coords
    size.times.map { |num| direction == :down ? [row + num, col] : [row, col + num] }
  end
end
