require_relative "human_player"
require_relative "computer_player"
class PegBoard
    COLORS = ["red", "blue", "green", "orange", "yellow", "purple"]
    
    attr_reader :board
    attr_accessor :tries 
    
    def initialize
        @board = {}
        @tries = 12 
    end

    def computer_set_board
        count = 0
        4.times do 
             @board[count] = COLORS.sample
             count += 1
        end 
    end

    def computer_board_arr
        arr = [] 
        @board.each { |k, v| arr << v }
        arr
    end

    def player_set_board(player_input)
        player_input.each.with_index { |ele, idx| @board[idx] = ele }
    end

    # Takes an array of the players guess. If the idx is used as a key
    # and the element is equal to the value ele becomes white
    # if its the correct color, but in the wrong place it becomes black
    # if its neither in the right place or right color it returns the original
    # color

    def return_guess(player_input) 
        player_input.map!.with_index do |ele, idx|
            if @board[idx] == ele 
                "white"
            elsif @board.has_value?(ele) && @board[idx] != ele
                "black" 
            else 
                ele 
            end 
        end
    end

    def win?(player_input)
        return_guess(player_input).all? { |ele| ele == "white" }
    end

    def failed_tries(player_input)
        @tries -= 1 unless win?(player_input)
    end
end