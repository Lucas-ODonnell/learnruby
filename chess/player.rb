class Player
    attr_accessor :name 
    attr_reader :color
    def initialize(color)
        @color = color 
        @name = ask_name
    end 

    def ask_name
        print "What is your name? "
        @name = gets.chomp 
    end
end