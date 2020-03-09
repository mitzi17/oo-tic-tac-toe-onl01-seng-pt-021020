class TicTacToe
  
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
    #Array.new(9, ' ')
  end
  
  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
    ]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
  #change input to index, sub 1
  user_input.to_i - 1
end

def move(idx, char)
  @board[idx] = char
end

def position_taken?(idx)
  #if @board[idx] == " "
  #return false
  #else return TRUE
  #end or can be written as below

  #@board[idx] != " "  or can be refactored as below too
  
  (@board[idx] == " ") ? false : true
end

def valid_move?(idx)
  #check to see if we are cheating/ space is used
  
  # !(position_taken?(idx))
  # idx.between?(0, 8) || (0..8).to_a.include?(idx)
  
  idx.between?(0, 8) && !(self.position_taken?(idx))
end

def turn_count
  @board.count('X') + @board.count('O')
end

def current_player
  (self.turn_count.even?) ? 'X' : 'O'
end

def turn
  input = gets.chomp #ask user for input
  #where they want to move on the board, nums 1-9
  
  puts input
  
  index = self.input_to_index(input)
  token = self.current_player
  
  if self.valid_move?(index) #validate user input
    self.move(index, token) #make valid moves
    self.display_board
  else
    self.turn
  end
end

def full?
  # !(@board.any?{ |el| el == ' '})
  #or can be as below
  # @board.all?{ |el| el == 'X' || el == 'O'}
  #or can be as below, either of these will work
  
  !(@board.include?(' '))
end

def won?
  # first person to place chars in order of one of the winning WIN_COMBINATIONS
  
  #compare the token at each winning index num within the win_combination arr
  
  win_combo = nil
  
  #using position taken to catch empty spaces, when searching for winning combo
  
  WIN_COMBINATIONS.each do |arr|
    if @board[arr[0]] == @board[arr[1]] && @board[arr[1]] == @board[arr[2]] && position_taken?(arr[0])
      win_combo = arr
    end
  end
  
  win_combo
end

def draw?
  #if theres no winning combo AND the board is full
  !(self.won?) && self.full?
end

def over?
  #if theres a draw OR someone won
  self.draw? || self.won?
end

def winner
  #need a char of winner or return nil
  
  if self.won?
    @board[self.won?[0]]
  else
    nil
  end
  
  #@board[self.won?[0]] if self.won?
end

def play
  #asks for players input on a turn of the game
  #checks if the game is over after every turn
  #plays the first turn of the game
  #checks if the game is won after every turn
  #checks if the game is draw after every turn
  #stops playing if someone has won
  #congratulates the winner X or O
  #stops playing in a draw
  #prints "Cat\'s Game!" on a draw
  #plays through an entire game

    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end
  


end