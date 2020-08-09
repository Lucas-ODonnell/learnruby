require_relative "peg_board"
class ComputerPlayer
    attr_accessor :guess, :correct_board, :score
    attr_reader :name
    
    
    def initialize
        @name = "Hal 9000"
        @score = 0
        @correct_board = {}
    end

    def computer_guess
        hash = {}
        count = 0
        4.times do
            hash[count] = PegBoard::COLORS.sample
            count += 1
        end 
        hash
    end

    def computer_reset
        @correct_board = {}
    end
end