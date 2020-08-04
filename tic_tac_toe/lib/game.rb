require_relative "board"
require_relative "players"
class Game
    private
    def initialize
        welcome 
        @player_1 = Player.new(:X)
        @player_2 = Player.new(:O)
        @current_player = @player_1
        @board = Board.new
        system("clear")
        play_game
    end

    def welcome
        puts "Welcome to tictactoe. You don't know how to play?"
        puts "Do you live under a rock?"
        puts "If you are going first you are X. Player_2 you are O"
        puts "You win if you get three in a row up, down, or diagonal"
        puts "May the best human win!"
        puts "Press any key to start"
        gets.chomp
    end

    
    def current_player_switch
        if @current_player == @player_1
            @current_player = @player_2 
        else
            @current_player = @player_1
        end
    end

    def play_game
        until @board.empty_positions? == false
            @board.print
            puts
            puts
            puts "#{@current_player.name} please put your X or O on an empty position on the board"
            puts "First number is for row, second number is for column. 1 1 would be the top left position."
            puts "If you choose a position that has already been taken, because you can't count
            the other player gets to go."
            print "Input: "
            
            
            pos = @current_player.choose_position
            @board.mark_position(pos, @current_player.players_value)
            if @board.win?(@current_player.players_value)
                puts "#{@current_player.name} has won!"
                puts "Game Over"
                return
            else
                current_player_switch 
            end
            system("clear")
        end

        puts "It's a draw"
        puts "Game Over"
    end
end