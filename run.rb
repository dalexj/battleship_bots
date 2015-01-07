require_relative 'lib/engine'
engine = BattleshipEngine.new(SampleBot, SampleBot)
engine.start_game
engine.play_fully
