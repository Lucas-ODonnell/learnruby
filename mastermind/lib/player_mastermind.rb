require_relative "human_player.rb"
require_relative "smart_computer.rb"
#The minimax algorithm seems hard to implement. Since there are 6 tries I could have the computer make a hash where every value is the same color.
#I think that would guarantee a win in 6 turns. That's dumb though and isn't really the point of the game so I'm not going to do that.
puts "Welcome to Mastermind. In this version you selected you need to create a four part code that the
computer can not beat. Code colors are red, blue, green, orange, yellow
and purple. The code could be [red, green, orange, yellow]. You win the round if the computer fails
to guess your code. There are four rounds"

print "Press enter if you are ready to play: "
gets.chomp 
system("clear")
print "What is your name? "
name = gets.chomp 
player = HumanPlayer.new(name)
player_board = PegBoard.new 
computer = ComputerPlayer.new 

    4.times do 
    puts "Hello #{player.name}!"
    puts "Please make a random code!"
    player_board.player_set_board(player.player_input)
    puts "The board is set."
    puts player_board.board
    player_board.tries = 12
    computer.computer_reset
    sleep(2)
    system("clear")

            while player_board.tries > 0 #computer gets 12 guesses
                computer_guess = computer.computer_guess
                computer_guess.each do |k,v|
                    if computer.correct_board == player_board.board
                        puts "the computer #{computer.name} won in #{12 - player_board.tries} turns"
                        puts "#{computer.name} gains a point"
                        computer.score += 1
                        puts "#{player_board.hash_to_array(computer.correct_board)}"
                        print "Press any key to go to the next round: "
                        gets.chomp
                        system("clear")
                        player_board.tries = 0 #this is to get out of the while loop
                        break
                    elsif computer_guess[k] == player_board.board[k]
                        computer.correct_board[k] = v 
                    end
            end
                unless computer.correct_board == player_board.board
                player_board.tries -= 1
                puts "current correct = #{computer.correct_board.length}"
                puts "tries left = #{player_board.tries} "
                puts "The computer is guessing again ........"
                sleep(1)
                system("clear")
                end
            end
    
        
            if player_board.tries <= 0 && computer.correct_board != player_board.board 
            #we will get false positives if we don't add the right side of &&
            puts "#{computer.name} lost. Congratulations you gain a point"
            player.score += 1
            puts
            computer.computer_reset
            print "Press any key to go to the next round: "
            gets.chomp
            system("clear")
            end
    end

if player.score > computer.score
    puts "congratulations you won. Score: #{player.score}"
elsif player.score < computer.score 
    puts "The computer won :( 
    Score: #{computer.score}"
else
    puts "It's a draw"
end

print "Press any key to exit: "
gets.chomp
