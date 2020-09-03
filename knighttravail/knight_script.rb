require_relative "board"
require_relative "knight"

chess_board = Board.new
knight = Knight.new

chess_board.print 
puts "Enter in a start position [x,y]"
    start = gets.chomp.split(",").map(&:to_i)
    system("clear")
    chess_board.print
puts "Enter in an end position [x,y] and I will show you the shortest path"
    destination = gets.chomp.split(",").map(&:to_i)
    system("clear")
    chess_board.print
sleep(1)

answer = knight.knight_moves(start, destination)
puts "You made it in #{answer.length} moves! 
Your path was #{answer}" 
