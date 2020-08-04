require_relative "./lib/game"
puts "Welcome  to tic_tac_toe version 5000. If you don't want to be here
please enter ctrl^c. If you do want to play press enter"
gets.chomp
puts "You are still here? Ok I guess you want to play?"
print "How many games do you want to play? (Put in a number): "
gets.chomp.to_i.times do
Game.new
end
