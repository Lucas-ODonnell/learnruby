require_relative "./../hangman"
require_relative "./../player"

puts "Welcome to hangman! The computer will choose a random word from
the dictionary. It is your job to guess the word before you are hanged.
Good luck!"

print "Press enter to continue "
gets.chomp

player = Player.new
game = Hangman.new 
system("clear")
player.player_name

print "#{player.name}, would you like to start a saved game? y/Y n/N "
player_choice = gets.chomp 
if player_choice == "y" || player_choice == "Y"
    game = game.load_game
end

until game.win? || game.tries <= 0
    game.update_board(player.choose_letter)
    if game.win?
        puts "Congratulations you won"
        puts "The word was: #{game.board.join("")}"
    else
        puts "Your current board: #{game.board.join(" ")}"
        puts "You have #{game.tries} tries left."
        puts "Letters guessed: #{game.used_letters}"
        puts 
        print "Press n/N to continue, press y/Y if you want to save your game
        and quit. "
        positive = gets.chomp
        if positive == "y" || positive == "Y"
            game.save_game
            puts "game saved"
            return
        end
        system("clear")
    end
end

if game.tries <= 0
    puts "Oh no you have died!"
    puts "The word was #{game.rand_word}"
end

