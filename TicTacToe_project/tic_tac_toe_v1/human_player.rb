class HumanPlayer

    attr_reader :mark
    def initialize(mark)
        @mark = mark
    end

    def get_position
        print "Player, enter two numbers representing a position in the format `row col`"
        string = gets.chomp
        numbers = string.split(" ")
        index = numbers.map { |number| number.to_i }
        raise "sorry that was invalid" if index.length != 2
        index
    end

end