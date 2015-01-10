# Battleship
Battle other people with your own bots!

### Quick Start Guide
1. Clone the repo `$ git clone https://github.com/dalexj/battleship_bots.git`
2. cd into the repo `$ cd battleship_bots`
3. Start making your own bot, using `lib/sample_bot.rb` as a guideline
4. Edit `run.rb` so that the BattleshipEngine initializes with your Bot class
5. Run `$ ruby run.rb` to watch 2 the fight
6. `$ ruby gui.rb` will show an unfinished graphical representation of the battle
Note: requires Ruby 1.9 and [Gosu](http://www.libgosu.org/ "Gosu")

### Making Your Own Bot
Your Bot class must respond to 2 different methods.
The first method,
`place_ships` will setup where your ships will be placed.

The `place_ships` method should take in an instance of MapGenerator
which has 5 "placing" methods:

`place_battleship`, `place_carrier`,
`place_cruiser`, `place_submarine`, and `place_destroyer`.

Calling any one of these will override the last call of it so you can call
the same one twice if you need.

For allowance of randomly generated ship placement,
the MapGenerator also has the method `valid_placements?`

The second method, `take_turn`
is the one that will be called every turn that your bot can take,
and it should accept 1 argument of the current board the bot is shooting at.
The board is a 10x10 2-dimensional array containing the data of the map.

You can check what mark a spot on the map has using:
`board[row][column] == Map::EMPTY_MARK`

There are also:
`Map::HIT_MARK`
`Map::MISS_MARK`

The return value here should be an array of the 2 coordinates you would
like to fire at in the format: `[row, column]`

To see an example, look at `lib/sample_bot.rb` and `lib/better_bot.rb`
