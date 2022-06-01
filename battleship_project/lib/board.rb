class Board
  
    attr_reader :size
    attr_accessor :grid

    def self.print_grid(arr)                            #I always struggle on these class methods - this method doesn't care about the instances of the board class
        arr.each do |sub_arr| 
            puts sub_arr.join(" ")
        end 
    end

    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N)}
        @size = n * n
    end

    def [](array)
        @grid[array[0]][array[1]]
    end

    def []= (position, value)
        @grid[position[0]][position[1]] = value
    end

    def num_ships                                   #to use an instance method, we have to use 
        count = 0
        @grid.flatten.each { |ele| count +=1 if ele != :N }
        count
    end
        
    def attack(position)
        if self.[](position) != :N
            self.[]=(position, :H)
            p 'you sunk my battleship!'
            return true
        else
            self.[]=(position, :X)
            return false
        end
    end

    def place_random_ships

        i = 0
        while i < @size / 4
            random_row = rand(0...@grid.length)
            random_column = rand(0...@grid.length)
            array = [random_row, random_column]
            if self.[](array) != :S
                self.[]=(array, :S)
                i += 1
            end
        end
    end

    def hidden_ships_grid
        new_grid = []
        @grid.each do |sub_arr|
            new_grid << sub_arr.map { |ele| ele == :S ? ele = :N : ele }
        end

        new_grid
    end

    def cheat
        Board.print_grid(@grid)             #why do you have to use Board instead of self here?
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end

end
