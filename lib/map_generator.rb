class MapGenerator
  attr_reader :battleship, :carrier, :cruiser, :submarine, :destroyer

  def place_battleship(attributes)
    @battleship = attributes
  end

  def place_carrier(attributes)
    @carrier = attributes
  end

  def place_cruiser(attributes)
    @cruiser = attributes
  end

  def place_submarine(attributes)
    @submarine = attributes
  end

  def place_destroyer(attributes)
    @destroyer = attributes
  end

  def valid_placements?
    begin
      to_map
      true
    rescue
      false
    end
  end

  def to_map
    map = Map.new(10)
    map.place_ship(   @carrier.merge( size: 5 ))
    map.place_ship(@battleship.merge( size: 4 ))
    map.place_ship(   @cruiser.merge( size: 3 ))
    map.place_ship( @submarine.merge( size: 3 ))
    map.place_ship( @destroyer.merge( size: 2 ))
  end
end
