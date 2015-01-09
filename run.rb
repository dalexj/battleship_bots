require_relative 'lib/engine'

engine = BattleshipEngine.new(SampleBot, SampleBot)
engine.start_game
engine.print_boards_with_ship_locs
engine.take_turn
engine.print_boards
engine.play_fully
