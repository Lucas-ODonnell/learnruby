require_relative "human_player.rb"
require_relative "peg_board.rb"

puts "Welcome to Mastermind. In this version you selected you need to break
the computers four part code. Code colors are red, blue, green, orange, yellow
and purple. The code could be [red, green, orange, yellow]. If you successfully
put in red, green, orange, yellow the computer would return [black, black, black, black].
If the color is right, but the position is wrong, the computer will return the color as white.
If the color is wrong and the position is wrong the computer will return your original color.
You have 12 guesses until you lose"
print "Press enter if you are ready to play: "
gets.chomp 

print "What is your name? "
name = gets.chomp 
player = HumanPlayer.new(name)
computer_board = PegBoard.new 
puts "Hello #{player.name}!"
puts "Computer is now making a random code"
computer_board.computer_set_board
puts "The board is set. It's time for you to make your first guess"
until computer_board.tries <= 0
player_guess = player.player_input
  if computer_board.win?(player_guess)
      puts "#{computer_board.return_guess(player_guess)} It looks 
      like you beat the computer congratulations"
      return
  else
      puts "#{computer_board.return_guess(player_guess)} not quite there
      you'll get it next time. Press enter to try again"
      computer_board.failed_tries(player_guess)
      gets.chomp 
      system("clear")
  end
end 

puts "sorry you lost."
puts "#{computer_board.computer_board_arr}"


