class MapGenerator
  attr_reader :battleship, :carrier, :cruiser, :submarine, :destroyer

  def place_battleship(hash);   @battleship = hash;   end
  def place_carrier(hash);      @carrier = hash;   end
  def place_cruiser(hash);      @cruiser = hash;   end
  def place_submarine(hash);    @submarine = hash;   end
  def place_destroyer(hash);    @destroyer = hash;   end
end
