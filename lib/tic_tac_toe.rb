# Build a tic-tac-toe game

class Game
  def initialize
    @board = ["0","1","2","3","4","5","6","7","8","9"]
    @spot = nil
    run_game
  end

  # opens and starts the game
  def start_game
    puts "Let's play tic-tac-toe!"
    display_board
  end

  # prints the board
  def display_board
    puts "-----|-----|-----|"
    puts "  #{@board[1]}  |  #{@board[2]}  |  #{@board[3]}  |"
    puts "-----|-----|-----|"
    puts "  #{@board[4]}  |  #{@board[5]}  |  #{@board[6]}  |"
    puts "-----|-----|-----|"
    puts "  #{@board[7]}  |  #{@board[8]}  |  #{@board[9]}  |"
    puts "_____|_____|_____|"
  end


  # promps the user for input
  def get_valid_input
    puts "Enter your move: "
    validate(gets.chomp) || try_again
  end

  # checks if the input matches any spot in the board
  def validate(input)
    @spot = @board.detect{ |valid_spot| valid_spot == input }
  end

  # prompts the user again if the input is invalid
  def try_again
    puts "Try again"
    get_valid_input
  end

  # updates the board according to the input
  def update_board(player)
    @board[@spot.to_i] = player
    display_board
  end


  # alternates the player
  def swap_player(player)
    player == "X" ? "O" : "X"
  end

  # checks if there any free spots left in the board
  def available_spots?
    spots = ["1","2","3","4","5","6","7","8","9"]
    if (@board & spots).any? == false
      puts "No spots left! It's a draw!"
      exit
    end
  end

  def any_winner
    if (@board[1] == @board[2] && @board[2] == @board[3])
        return true
    elsif (@board[4] == @board[5] && @board[5] == @board[6])
      return true
    elsif (@board[7] == @board[8] && @board[8] == @board[9])
      return true
    elsif (@board[1] == @board[4] && @board[4] == @board[7])
      return true
    elsif (@board[2] == @board[5] && @board[5] == @board[8])
      return true
    elsif (@board[3] == @board[6] && @board[6] == @board[9])
      return true
    elsif (@board[1] == @board[5] && @board[5] == @board[9])
      return true
    elsif (@board[3] == @board[5] && @board[5] == @board[7])
      return true
    else
      return false
    end
  end

  def announce_winner(player)
    puts "Congratulations! Player #{player} has won!"
    exit
  end

  def run_game
    start_game
    player = "X"
    loop do
      @spot = nil
      available_spots?
      player = swap_player(player)
      get_valid_input
      update_board(player)
      announce_winner(player) if any_winner
    end
  end
end

game = Game.new
