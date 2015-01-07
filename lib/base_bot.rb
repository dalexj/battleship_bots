module Bot
end
class Bot::Base
  attr_reader :battleship, :carrier, :cruiser, :submarine, :destroyer, :guess

  def place_battleship(hash);   @battleship = hash;   end
  def place_carrier(hash);      @carrier = hash;   end
  def place_cruiser(hash);      @cruiser = hash;   end
  def place_submarine(hash);    @submarine = hash;   end
  def place_destroyer(hash);    @destroyer = hash;   end

  def reset
    @guess = nil
  end

  def take_guess(input)
    @guess = input
  end
end
