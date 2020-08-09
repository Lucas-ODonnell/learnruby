require_relative "human_player"
require_relative "peg_board"
require_relative "smart_computer"

puts "Welcome to Mastermind. In this version you selected you need to break
the computers four part code. Code colors are red, blue, green, orange, yellow
and purple. The code could be [red, green, orange, yellow]. If you successfully
put in red, green, orange, yellow the computer would return [black, black, black, black].
If the color is right, but the position is wrong, the computer will return the color as white.
If the color is wrong and the position is wrong the computer will return your original color.
You have 12 guesses until you lose. There are four rounds"
print "Press enter if you are ready to play: "

gets.chomp 

system("clear")
print "What is your name? "
name = gets.chomp 
player = HumanPlayer.new(name)
computer_board = PegBoard.new 
computer = ComputerPlayer.new 
system("clear")

4.times do 
    puts "Hello #{player.name}!"
    puts "The computer is now making a random code"
    sleep(2)
    computer_board.computer_set_board
    puts "The board is set. It's time for you to make your first guess"
    until computer_board.tries <= 0
        player_guess = player.player_input
        if computer_board.win?(player_guess)
        puts "#{computer_board.return_guess(player_guess)} It looks 
        like you beat the computer in #{12 - computer_board.tries} tries congratulations"
        puts "You gain a point"
        player.score += 1
        computer_board.tries = 12
        print "Press any key to go to the next round: "
        gets.chomp
        system("clear")
        break
        else
        puts "#{computer_board.return_guess(player_guess)} not quite there
        you'll get it next time. Tries left: #{computer_board.tries - 1} Press enter to try again"
        computer_board.failed_tries(player_guess)
        gets.chomp 
        system("clear")
        end
    end 
    unless computer_board.win?(player_guess)
    puts "sorry you lost. The computer gains a point"
    computer.score += 1
    puts "#{computer_board.computer_board_arr}"
    puts
    print "press any key to go to the next round: "
    gets.chomp
    system("clear")
    end
end

if player.score > computer.score
    puts "congratulations you beat the computer #{player.score} out of 4 times"
else
    puts "You have been destroyed by the computer, sad."
end

print "Press any key to quit: "
gets.chomp

