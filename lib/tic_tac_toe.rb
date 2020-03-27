class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " ", ]
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2],
  ]
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, token)
    @board[index] = token
  end

  def position_taken(answer)
    @board[answer] != " "
  end

  def valid_move(number_entered, board)
    number_entered?(0, 8) && !(position_taken?(board, number_entered))
  end

  def turn(board)
      puts "Please enter 1-9:"
      answer = gets.chomp
      answer = input_to_index(answer)
      if valid_move?(answer, board)
        move(board, answer)
        display_board(board)
        #turn(board)
      else
        puts "That is an invalid entry!"
        turn(board)
      end
  end

  def turn_count(board)
    board.count{|token| token == "X" || token == "O"}
  end

  def current_player(board)
  #if turn_count(board) %  == 0
    num = turn_count(board)
    if num % 2 == 0
      return "X"
    else
      return "O"
    #puts "divisible by 2"
    end
  end

  def won?(array)
  WIN_COMBINATIONS.each do |winner_set|
    if array[winner_set[0]] == array[winner_set[1]] &&
       array[winner_set[1]] == array[winner_set[2]] &&
       position_taken?(array, winner_set[0])
       puts "somebody won!"
       return true
       return winner_set
    end
   end
  end

  def full?(array)
    if !(array.any?{|i| i == " "})
      puts "the board is full!"
      return true
    else
      puts "the board is not yet full"
      return false
    end
  end

  def draw?(array2)
    if full?(array2) && !(won?(array2))
      puts "oh no it looks like a draw!"
      return true
    else
      puts "it's not a draw afterall"
      return false
    end
  end

  def over?(array3)
    if full?(array3) || !(won?(array3)) || draw?(array3)
      puts "GAME OVER"
      return true
    else
      puts "it ain't over till it's over baby!"
      return false
    end
  end

  def winner(board)
    if winning_combo = won?(board)
      board[winning_combo.first]
    end
  end

  def play(board)
    while !over?(board)
      turn(board)
    end

    if won?(board)
      puts "Congradulations"
    elsif draw?(board)
      puts "CatsGame!"
    end
  end

end

    
  
