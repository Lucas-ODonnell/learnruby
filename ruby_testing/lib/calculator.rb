class Calculator
    def add(*nums)
        nums.sum
    end

    def subtract(*nums)
        array = nums.to_a 
        difference = array.first
        (1..array.length-1).each { |idx| difference -= array[idx]}
        difference
    end

    def multiply(*nums)
        array = nums.to_a 
        product = 1 
        array.each { |num| product *= num}
        product
    end

    def divide(*nums)
        array = nums.to_a 
        quotient = array.first
        (1..array.length-1).each { |idx| quotient /= array[idx]}
        quotient
    end
end