class Player
    attr_reader :name
    def initialize
        @name = ""
    end

    def player_name
        print "Please enter your name: "
        @name << gets.chomp 
    end

    def choose_letter
        alpha = ("a".."z").to_a 
        player_letter = ""
        print "Hello, #{self.name} please choose a letter: "
        letter = gets.chomp.downcase
        if alpha.include?(letter)
            player_letter += letter 
        else
            puts "That is not a valid letter"
        end
        player_letter
    end
end