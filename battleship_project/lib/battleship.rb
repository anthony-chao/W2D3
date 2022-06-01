require_relative "board"
require_relative "player"

class Battleship
    
    attr_reader :board, :player
    attr_accessor :remaining_misses
    
    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size / 2
    end

    def start_game
        @board.place_random_ships
        print "There are #{@board.num_ships} hidden ships on the board."
        @board.print                #why are we using board.print instead of print @board?
        
    end

    def lose?
        if @remaining_misses <= 0
            print "you lose"
            return true
        else
            return false
        end
    end

    def win?
        if @board.num_ships == 0
            print "you win"
            return true
        else
            return false
        end
    end

    def game_over?
        if win? || lose?
            return true
        else
            return false
        end
    end

    def turn
        move = @player.get_move
        if @board.attack(move) == false
            @remaining_misses -= 1
        end
        @board.print
        print @remaining_misses
    end

end
