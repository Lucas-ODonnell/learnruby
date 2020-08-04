class Player
    attr_reader :players_value, :name
    def initialize(players_value)
        @name = "" #empty string so we can ask player for name
        player_name
        @players_value = players_value 
    end

    def player_name
        puts "Player what is your name?"
        @name += gets.chomp 
    end
    
    def choose_position
        pos = gets.chomp.split(" ")
        
        if pos.any? { |num| num.to_i < 1 || num.to_i > 3 } 
            puts "This is not a valid position. Make sure
            there is a space between each number.
            First number is row, second is column."
            print "Please try again: "
            choose_position #loop the same method instead of raising an error
        else
        pos.map { |num| num.to_i - 1 }
        end
    end
end