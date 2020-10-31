require './lib/connect4.rb' 

describe Board do 
  describe "#game_end?" do 
    it "Ends game with 4 in a row" do
      r = "\u2600".encode('utf-8') # red piece
      board = Board.new(['#','#','#','#','#','#','#',
                         '#','#','#','#','#','#','#',
                         '#','#','#','#','#','#','#', 
                         '#','#','#','#','#','#','#',
                         '#','#','#','#','#','#','#',
                         '#','#', r,  r , r , r ,'#'])
      expect(board.game_end?(board.cells)).to eql(true)
    end
    it "Ends game with 4 in a column" do 
      b = "\u2601".encode('utf-8') # black piece 
      board = Board.new(['#','#','#','#','#','#','#',
                         '#','#','#','#','#','#','#',
                         '#','#', b ,'#','#','#','#', 
                         '#','#', b ,'#','#','#','#',
                         '#','#', b ,'#','#','#','#',
                         '#','#', b ,'#','#','#','#'])
      expect(board.game_end?(board.cells)).to eql(true)
    end
    it "Ends game with 4 diagonal top right" do
      b = "\u2601".encode('utf-8') # black piece 
      board = Board.new(['#','#','#','#', b ,'#','#',
                         '#','#','#', b ,'#','#','#',
                         '#','#', b ,'#','#','#','#', 
                         '#', b ,'#','#','#','#','#',
                         '#','#','#','#','#','#','#',
                         '#','#','#','#','#','#','#'])
      expect(board.game_end?(board.cells)).to eql(true)
    end
    it "Ends game with 4 diagonal top left" do
      r = "\u2600".encode('utf-8') # red piece 
      board = Board.new(['#','#','#','#','#','#','#',
                         '#','#','#','#','#','#','#',
                          r ,'#','#','#','#','#','#', 
                         '#', r ,'#','#','#','#','#',
                         '#','#', r ,'#','#','#','#',
                         '#','#','#', r ,'#','#','#'])
      expect(board.game_end?(board.cells)).to eql(true)
    end
    it "Does not end game when it should not" do 
      r = "\u2600".encode('utf-8') # red piece 
      board = Board.new(['#','#','#','#','#','#','#',
                         '#','#','#','#','#','#','#',
                         '#' ,'#','#','#','#','#','#', 
                         '#', r ,'#','#','#','#','#',
                         '#','#', r ,'#','#','#','#',
                         '#','#','#', r ,'#','#','#'])
      expect(board.game_end?(board.cells)).to eql(false)
    end
  end 
  describe "#draw_board" do
    it "Draws an empty board correctly." do
      board = Board.new(['#','#','#','#','#','#','#',
                         '#','#','#','#','#','#','#',
                         '#','#','#','#','#','#','#', 
                         '#','#','#','#','#','#','#',
                         '#','#','#','#','#','#','#',
                         '#','#','#','#','#','#','#'])
      expect { board.draw_board(board.cells) }.to output(
        " #  #  #  #  #  #  # 
 #  #  #  #  #  #  # 
 #  #  #  #  #  #  # 
 #  #  #  #  #  #  # 
 #  #  #  #  #  #  # 
 #  #  #  #  #  #  # \n").to_stdout
    end
    it "Draws a played board correctly." do
      board = Board.new(['#','#','#','#','#','#','#',
                         '#','#','#','#','#','#','#',
                         '#','#','#','#','#','#','#', 
                         '#','#','#','A','#','#','#',
                         'A','A','#','B','#','#','#',
                         'A','B','B','A','A','#','#'])
      expect { board.draw_board(board.cells) }.to output(
        " #  #  #  #  #  #  # 
 #  #  #  #  #  #  # 
 #  #  #  #  #  #  # 
 #  #  #  A  #  #  # 
 A  A  #  B  #  #  # 
 A  B  B  A  A  #  # \n").to_stdout
    end
  end
end