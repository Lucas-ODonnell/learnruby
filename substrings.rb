def substrings(words, dictionary)
    substring = Hash.new(0)
    dictionary.each do |ele|
        words.split(" ").each do |word|
           substring[ele] += 1 if word.downcase.include?(ele)
        end
    end
    substring
end



