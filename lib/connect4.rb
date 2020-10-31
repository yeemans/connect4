class Board 
    attr_accessor :cells
    def initialize(cells) 
      @cells = cells 
    end 
  
    def game_end?(cells)  
      # iterate through cells, see if each spot has a connect 4 
      # 4 across check 
      i = 0 
      while i < cells.count 
        # 4 across
        return true if cells[i] == cells[i + 1] && cells[i] == cells[i + 2] && 
        cells[i] == cells[i + 3] && cells[i] != "#"
        # 4 in a column
        return true if cells[i] == cells[i + 7] && cells[i] == cells[i + 14] && 
        cells[i] == cells[i + 21] && cells[i] != "#"
        # diagonal with top in the right 
        return true if cells[i] == cells[i + 6] && cells[i] == cells[i + 12] &&
        cells[i] == cells[i + 18] && cells[i] != "#"
        # diagonal with top in the left 
        return true if cells[i] == cells[i + 8] && cells[i] == cells[i + 16] && 
        cells[i] == cells[i + 24] && cells[i] != "#"
        # iterate through the board
        i += 1
      end 
      return false  
    end 
  
    def draw_board(cells)
      index = 0
      cells.each do |circle| 
        index += 1 
        print(" #{circle} ")
        print("\n") if index % 7 == 0 # print a newline for each row
      end
    end
  
    def get_turn(column, turn)
      # if input is invalid
      if column > 6 || column < 0 
        p "column: "
        get_turn(gets.chomp.to_i, turn)
      end
  
      column += 7 while cells[column + 7] == "#"
  
      # incase the spot is already taken 
      if cells[column] != "#"
        p "column: "
        get_turn(gets.chomp.to_i, turn) 
      end
      cells[column] = "\u2600".encode('utf-8') if turn % 2 == 0 
      cells[column] = "\u2601".encode('utf-8') if turn % 2 != 0 
      draw_board(cells)
      if !game_end?(cells)
        p "column: "
        get_turn(gets.chomp.to_i, turn + 1) 
      end
    end
  end
  cells = []
  cells.append('#') while cells.count < 42 
  game = Board.new(cells)
  p "column: "
  #game.get_turn(gets.chomp.to_i, 0)