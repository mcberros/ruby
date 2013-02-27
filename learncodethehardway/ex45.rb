require_relative './ex45_game'

a_game = Game.new(:corridor)
a_game.play()

a_game = Game.new(:bridge)
a_game.play()

a_game = Game.new(:armory)
a_game.play()

a_game = Game.new(:pod)
a_game.play()