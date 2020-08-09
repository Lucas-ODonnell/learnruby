require_relative "human_player"
require_relative "smart_computer"
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

    
    def return_guess(player_input) 
        #make empty array
        arr = Array.new(4)
        #make a temporary board
        temp = @board.dup
        player_input.map.with_index do |ele, idx|
            if @board[idx] == ele
                arr[idx] = "black"
                temp[idx] = "black" #need to turn this black so we don't get false whites
            else                    
                arr[idx] = ele  
            end
        end
        
        final_value = arr.each.with_index do |ele, idx|
            if temp[idx] != ele && temp.has_value?(ele) 
                arr[idx] = "white"
            else
                ele
            end
        end
        final_value  
    end

    def win?(player_input)
        return_guess(player_input).all? { |ele| ele == "black" }
    end
    
    def hash_to_array(hash)
        arr = hash.sort_by { |k,v| k }
        arr.flatten.filter_map.with_index { |ele,idx| ele if idx.odd? }
    end

    def failed_tries(player_input)
        @tries -= 1 unless win?(player_input)
    end
end