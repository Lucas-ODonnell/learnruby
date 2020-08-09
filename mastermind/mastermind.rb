puts "Welcome to Mastermind the game where you can be the coder or codebreaker."
print "Press enter if you are ready to play : "
gets.chomp 

print "Do you want to be the codebreaker?(y/Y) Press (n/N) if you want to be the codemaster: "
    answer = gets.chomp.downcase
    system("clear")
    if answer == "y"
        require_relative "lib/computer_mastermind"
    elsif answer == "n"
        require_relative "lib/player_mastermind"
    else
        puts "Goodbye"
    end


