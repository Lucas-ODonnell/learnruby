class HumanPlayer
    attr_reader :name
    def initialize(name)
        @name = name
    end 

    def player_input #guess
        guess = []
        4.times do 
        print "Please input a color: "
        guess << gets.chomp
        end 
        guess.map! { |ele| ele.downcase }
    end
end