require_relative 'base_bot'
require_relative 'map'
require_relative 'sample_bot'
require_relative 'ship'

class BattleshipEngine
  def initialize(bot_class_1, bot_class_2)
    @bot_1 = bot_class_1.new
    @map_1 = Map.new(10)
    @bot_2 = bot_class_2.new
    @map_2 = Map.new(10)
  end

  def start_game
    place_the_ships
  end

  def play_fully
    until @map_1.lost? || @map_2.lost?
      take_turn
    end
    puts "Player 1 is the winner" if @map_2.lost?
    puts "Player 2 is the winner" if @map_1.lost?
    print_boards
  end

  def take_turn
    one_turn(@bot_1, @map_1)
    one_turn(@bot_2, @map_2)
  end

  def print_boards
    puts "Bot 1's map"
    puts @map_1
    puts "Bot 2's map"
    puts @map_2
  end

  def print_boards_with_ship_locs
    temp = @map_1.dup
    temp.board = temp.dup_board
    temp.lol
    puts "Bot 1's map"
    puts temp

    temp = @map_2.dup
    temp.board = temp.dup_board
    temp.lol
    puts "Bot 2's map"
    puts temp
  end

  private

  def place_the_ships
    place_ships(@bot_1, @map_1)
    place_ships(@bot_2, @map_2)
  end

  def place_ships(bot, map)
    bot.place_ships
    map.place_ship(   bot.carrier.merge( size: 5 ))
    map.place_ship(bot.battleship.merge( size: 4 ))
    map.place_ship(   bot.cruiser.merge( size: 3 ))
    map.place_ship( bot.submarine.merge( size: 3 ))
    map.place_ship( bot.destroyer.merge( size: 2 ))
  end

  def one_turn(bot, map)
    bot.take_turn(map.dup_board)
    raise "You never guessed" unless bot.guess
    if bot.guess.is_a? Array
      map.guess(*bot.guess)
    elsif bot.guess.is_a? String
      map.guess_with_string(bot.guess)
    else
      raise "Invalid guess format"
    end
    bot.reset
  end
end
