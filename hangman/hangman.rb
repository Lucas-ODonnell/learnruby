require "yaml"
class Hangman
    attr_reader :rand_word, :board
    attr_accessor :tries, :used_letters
    def self.valid_words
        words = File.readlines("5desk.txt").map(&:chomp)
        valid_words = words.select do |word|
            word.length >= 5 && word.length <= 12
        end
        valid_words.sample
    end
    
    def initialize
        @rand_word = Hangman.valid_words
        @board = Array.new(@rand_word.length, "_")
        @used_letters = []
        @tries = @rand_word.length + 2
    end

    def correct_letter?(letter)
        @rand_word.include?(letter)
    end
    
    def valid_word_hash
        valid_hash = Hash.new { |h, k| h[k] = [] }
        @rand_word.split("").each.with_index { |ele, idx| valid_hash[ele] << idx }
        valid_hash 
    end

    def update_board(letter)
        if correct_letter?(letter)
            indexes = valid_word_hash[letter]
            indexes.each { |idx| @board[idx] = letter }
            @used_letters << letter 
        else
            @used_letters << letter 
            @tries -= 1
        end
    end

     def win?
        @tries >= 1 && @rand_word == @board.join("")
    end
######yaml##############3
    def save_game
        Dir.mkdir("saved_games") unless Dir.exist?("saved_games")
        print "Please name your save: "
        filename = "saved_games/#{gets.chomp}"
        File.open("#{filename}.yml", "w") { |file| file.write(self.to_yaml) }
    end

    def load_game
    print "Which file would you like to load? "
    player_choice = gets.chomp 
    YAML.load(File.read("saved_games/#{player_choice}.yml"))
    end
end


