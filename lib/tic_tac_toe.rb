# class TicTacToe
#   WIN_COMBINATIONS = [
#     [0,1,2],
#     [3,4,5],
#     [6,7,8],
#     [0,3,6],
#     [1,4,7],
#     [2,5,8],
#     [0,4,8],
#     [6,4,2],
#   ]
#   def initialize
#     @board = [' ',' ',' ',' ',' ',' ',' ',' ',' ']
#   end
#
#   def display_board
#     puts " #{@board[0]} | #{@board[1]} | #{@board[2]}  ".center(50,'-')
#     puts '-'.center(50, '-')
#     puts " #{@board[3]} | #{@board[4]} | #{@board[5]}  ".center(50,'-')
#     puts '-'.center(50, '-')
#     puts " #{@board[6]} | #{@board[7]} | #{@board[8]}  ".center(50,'-')
#     puts '-'.center(50, '-')
#   end
#
#   def input_to_index input
#     index = input.to_i - 1
#   end
#
#   def move(index, token = "X")
#     @board[index] = token
#   end
#
#   def position_taken?(index)
#     @board[index] != " "
#   end
#
#   def valid_move?(index)
#     index.between(0,8) && !position_taken?(index)
#   end
#
#   def turn_count
#     @board.count { |token| token == "X" || token == "O" }
#   end
#
#   def current_player
#     turn_count % 2 == 0 ? "X" : "O"
#   end
#
#   def turn
#     puts "Please enter a position (1-9):"
#     input = gets.strip
#     index = input_to_index(input)
#
#     if valid_move?(index)
#       move(index, current_player)
#       display_board
#     else
#       turn
#     end
#   end
#
#   def won?
#     WIN_COMBINATIONS.each do |combination|
#       positions = [@board[combination[0]], @board[combination[1]], @board[combination[2]]]
#       if positions.all?("X") || positions.all?("O")
#         return combination
#       end
#     end
#     false
#   end
#
#   def full?
#     @board.all? { |position| position != " " }
#   end
#
#   def draw?
#     !won? && full?
#   end
#
#   def over?
#     won? || draw?
#   end
#
#   def winner
#     if combination = won?
#       @board[combination[0]]
#     end
#   end
#
#   def play
#     until over?
#       turn
#     end
#
#     if won?
#       puts "Congratulations #{winner}!"
#     else
#       puts "The game ended in a draw."
#     end
#   end
# end
#

class TicTacToe
  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], # Horizontal combinations
    [0, 3, 6], [1, 4, 7], [2, 5, 8], # Vertical combinations
    [0, 4, 8], [2, 4, 6]              # Diagonal combinations
  ]

  def initialize
    @board =  [" "," "," "," "," "," "," "," "," ",]
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} ".center(50,'-')
    puts "-----------".center(50,'-')
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} ".center(50,'-')
    puts "-----------".center(50,'-')
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} ".center(50,'-')
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end

  def turn_count
    @board.count { |position| position != " " }
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    puts "Please enter a position (1-9):"
    input = gets.strip
    index = input_to_index(input)

    if valid_move?(index)
      token = current_player
      move(index, token)
      display_board
    else
      puts "Invalid move. Please try again."
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
      positions = [@board[combination[0]], @board[combination[1]], @board[combination[2]]]
      return combination if positions.all?("X") || positions.all?("O")
    end
    false
  end

  def full?
    @board.all? { |position| position != " " }
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    combination = won?
    combination ? @board[combination[0]] : nil
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
