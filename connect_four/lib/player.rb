class Player
    attr_reader :color, :name
    def initialize(color)
        @color = color
        @name = choose_name 
    end

    def choose_position
        puts "Where would you like to place your piece?"
        print "Choose between 1 and 7: "
        answer = gets.chomp.to_i 
        answer - 1
    end

    def choose_name
        puts "What is your name?"
        gets.chomp 
    end
end