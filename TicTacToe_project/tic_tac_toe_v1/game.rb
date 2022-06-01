require './board.rb'
require './human_player.rb'

class Game

    def initialize(player_1_mark, player_2_mark)
        @player_1 = player_1_mark
        @player_2 = player_2_mark
        @board = Board.new
        @current_player = player_1
    end

end
