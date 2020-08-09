require_relative "peg_board"
class HumanPlayer
    attr_reader :name
    attr_accessor :score
    def initialize(name)
        @name = name
        @score = 0
    end 

    def player_input #guess
        guess = []
        until guess.length == 4 
        print "Please input a color: "
        player_guess = gets.chomp.downcase
            if PegBoard::COLORS.include?(player_guess)
            guess << player_guess
            else
                puts "That is not a valid color"
            end
        end
        guess
    end
end