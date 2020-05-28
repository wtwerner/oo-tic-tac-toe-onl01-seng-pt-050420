class TicTacToe
 
    def initialize(board = nil)
      @board = board || Array.new(9, " ")
    end
    
    WIN_COMBINATIONS = [
     [0,1,2], # top row
     [3,4,5], # middle row
     [6,7,8], # bottom row
     [0,3,6], # left column
     [1,4,7], # middle column
     [2,5,8], # right column
     [0,4,8], # left to right diagonal
     [2,4,6]  # right to left diagonal
    ]
    
    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    
    def input_to_index(space)
      space.to_i - 1
    end
    
    def move(index, token = "X")
      @board[index] = token
    end
    
    def position_taken?(index)
      @board[index] != " "
    end
  
    def valid_move?(index)
      index.between?(0,8) && @board[index] == " "
    end
  
    def turn_count
      @board.count("X") + @board.count("O")
    end
  
    def current_player
      if self.turn_count.even?
        "X"
      else
        "O"
      end
    end
  
    def turn
      puts "Enter a number 1-9"
      input = gets
      index = input_to_index(input)
      if valid_move?(index)
        move(index, current_player)
        display_board
      else
        turn
      end
    end
  
    def won?
      WIN_COMBINATIONS.each do |combo|
        pos_1 = combo[0]
        pos_2 = combo[1]
        pos_3 = combo[2]
        
        bpos_1 = @board[pos_1]
        bpos_2 = @board[pos_2]
        bpos_3 = @board[pos_3]
  
        if bpos_1 == "X" && bpos_2 =="X" && bpos_3 == "X"
          return combo
        elsif bpos_1 == "O" && bpos_2 =="O" && bpos_3 == "O"
          return combo
        end
      end
      return false
    end
  
    def full?
      !@board.include?(" ")
    end
  
    def draw?
      full? && !won?
    end
    
    def over?
      draw? || won?
    end
    
    def winner
        if won? != false
            @board[won?[0]]
        else
            nil
        end
    end
    
    def play
        turn until over?
      
        if won?
          puts "Congratulations #{winner}!"
        elsif draw?
          puts "Cat's Game!"
        end
    end

  end

