# #Implement a caesar cipher that takes in a string and the shift factor and then outputs the modified string:
#   > caesar_cipher("What a string!", 5)
#   => "Bmfy f xywnsl!"

def caesar_cipher(sentence, n)
    sentence.split(" ").map { |word| translate(word, n) }.join(" ")
end

def translate(word, n)
    lower = ("a".."z").to_a
    upper = ("A".."Z").to_a 
    new_word = ""
    word.each_char do |ele|
        if lower.include?(ele)
            old_index = lower.index(ele)
            new_index = old_index + n 
            new_word += lower[new_index % 26]
        elsif upper.include?(ele)
            old_index = upper.index(ele)
            new_index = old_index + n 
            new_word += upper[new_index % 26]
        else
            new_word += ele 
        end
    end
    new_word
end
  
