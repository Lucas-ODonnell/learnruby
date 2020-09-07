require_relative "player"
require_relative "board"
class Game
    attr_reader :board, :player_1, :player_2
    attr_accessor :current_player
    def initialize
        welcome 
        @player_1 = Player.new("R")
        @player_2 = Player.new("Y")
        @current_player = @player_1 
        @board = Board.new 
        system("clear")
        play_game
    end
    
    def welcome
        puts "Welcome to Connect Four. You win if you are the first player to
        get four in a row vertically, horizontally, or diagonally."

        print "Press any key to play "
        gets.chomp 
    end

    def current_player_switch 
        if self.current_player == self.player_1
            self.current_player = self.player_2 
        else
            self.current_player = self.player_1
        end
    end

    def play_game
        until board.gameover? || board.win?(current_player.color)
            board.print 
            puts "Hello #{current_player.name}"
            answer = current_player.choose_position 
            board.mark_position(answer, current_player.color)
            system("clear")

            if board.win?(current_player.color)
                board.print
                puts "Congratulations #{current_player.name} has won!"
                puts "game over"
                print "press any key to exit: "
                gets.chomp
                return
            else 
                current_player_switch
            end
        end
        puts "It's a tie"
        puts "Game Over"
        print "press any key to exit: "
        gets.chomp
        return
    end
end