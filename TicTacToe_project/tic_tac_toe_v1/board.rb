class Board

    def initialize
        @grid = Array.new(3) { Array.new(3, '_')}

    end

    def valid?(position)
        position.all? { |ele| ele < 3 && ele >= 0 }
    end

    def empty?(position)
        row = position[0]
        column = position[1]
        @grid[row][column] == "_"
    end
    
    def place_mark(position, mark)
        if !valid?(position) || !empty?(position)
            raise "invalid mark"
        else
            @grid[position[0]][position[1]] = mark
        end
    end

    def print
        @grid
    end

    def win_row
        @grid.any? do |sub_arr|
            sub_arr.all? { |ele| ele != '_' }
        end
    end

    def win_column
        new_grid = @grid[0].zip(@grid[1], @grid[2])
        new_grid.any? do |sub_arr|
            sub_arr.all? { |ele| ele != '_' }
        end
    end

    def win_diagional
        if (@grid[0][0] == @grid[1][1] && @grid[1][1] == @grid[2][2] && @grid[1][1] != '_') || (@grid[0][2] == @grid[1][1] && @grid[2][0] && @grid[1][1] != '_')
            return true
        else
            return false
        end
    end

    def win?
        if win_row
            return true
        elsif win_column
            return true
        elsif win_diagional
            return true
        end
        false
    end

    def empty_positions?
        @grid.any? do |sub_arr|
            sub_arr.any? { |ele| ele == '_' }
        end
    end

end