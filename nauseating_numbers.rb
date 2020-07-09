require "prime"
def strange_sums(numbers) #array
    count = 0
    numbers.each_with_index do |num_1, idx_1|
        numbers.each_with_index do |num_2, idx_2|
            if idx_2 > idx_1 && num_1 + num_2 == 0
                count += 1
            end
        end
    end
    count
end
# p strange_sums([2, -3, 3, 4, -2])     # 2
# p strange_sums([42, 3, -1, -42])      # 1
# p strange_sums([-5, 5])               # 1
# p strange_sums([19, 6, -3, -20])      # 0
# p strange_sums([9])                   # 0

def pair_product(numbers, product) #numbers is an array
    numbers.each_with_index do |num_1, idx_1|
        numbers.each_with_index do |num_2, idx_2|
            if num_2 * num_1 == product && idx_2 > idx_1
                return true
            end
        end
    end
      false
end
# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)             # false

def rampant_repeats(str, hash)
    new_string = ""
    str.each_char do |ele|
        if hash.has_key?(ele)
            hash[ele].times { new_string += ele }
        else
            new_string += ele 
        end
    end
    new_string
end
# p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
# p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
# p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
# p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'

def perfect_square?(number)
    (1..number).one? { |num| number / num == num && num * num == number }
end
# p perfect_square?(1)     # true
# p perfect_square?(4)     # true
# p perfect_square?(64)    # true
# p perfect_square?(100)   # true
# p perfect_square?(169)   # true
# p perfect_square?(2)     # false
# p perfect_square?(40)    # false
# p perfect_square?(32)    # false
# p perfect_square?(50)    # false

def anti_prime?(number)
    hash = Hash.new { |h,k| h[k] = [] }
    (1..number).each do |num|
        (1..num).each do |i|
            if num % i == 0
                hash[num] << i 
            end
        end
    end
    max = hash.max_by { |k,v| v.length }
    return true if max[0] == number
    false
end
# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false

def matrix_addition(matrix_1, matrix_2)
    
    height = matrix_1.length
    width = matrix_1[0].length
    new_matrix = Array.new(height) { [0] * width }

    (0...height).each do |row|
        (0...width).each do |col|
            new_matrix[row][col] = matrix_1[row][col] + matrix_2[row][col]
        end
    end
    new_matrix

end
# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

def factors(num)
    array = []
    (1..num).each do |i|
        if num % i == 0
            array << i 
        end
    end
    array
end

def mutual_factors(*numbers) #not an array, just numbers
    numbers.map { |num| factors(num) }.inject(:&)
end
# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]

def tribonacci_number(n) #it's fibonacci with an extra thing to add
    return 1 if n == 1
    return 1 if n == 2
    return 2 if n == 3

    tribonacci_number(n - 1) + tribonacci_number(n - 2) + tribonacci_number(n - 3)
end
# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274

# def tribonacci_number(n)
#     seq = [1, 1, 2]
#     while seq.length <= n
#         seq << seq[-3] + seq[-2] + seq[-1]
#     end
#     seq[n - 1]
# end

def matrix_addition_reloaded(*matrices)
        matrix = matrices.first 
        height = matrix.length
        width = matrix[0].length
        new_matrix = Array.new(height) { [0] * width }
    
        matrices.inject(new_matrix) do |m1, m2|
            return nil if m2.length != height || m2[0].length != width
            matrix_addition(m1, m2) #call previous method
        end
end
# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

def squarocol?(arr) #2d array
    return true if arr.any? { |row| row.uniq.length == 1 }
    return true if arr.transpose.any? { |col| col.uniq.length == 1}
    false
end
# p squarocol?([
#     [:a, :x , :d],
#     [:b, :x , :e],
#     [:c, :x , :f],
# ]) # true

# p squarocol?([
#     [:x, :y, :x],
#     [:x, :z, :x],
#     [:o, :o, :o],
# ]) # true

# p squarocol?([
#     [:o, :x , :o],
#     [:x, :o , :x],
#     [:o, :x , :o],
# ]) # false

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 7],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # true

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 0],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # false
def adjacent_sums(arr)
    sum = [] 

    (0...arr.length-1).each do |idx|
        sum << arr[idx] + arr[idx + 1]
    end
    sum
end

def pascals_triangle(n)
    triangle = [[1]]

    while triangle.length < n 
        one_above = triangle.last
        current_row = [1]
        current_row += adjacent_sums(one_above)
        current_row << 1
        triangle << current_row
    end
     triangle
end
# p pascals_triangle(5)
# # [
# #     [1],     
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1]
# # ]

# p pascals_triangle(7)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1],
# #     [1, 5, 10, 10, 5, 1],
# #     [1, 6, 15, 20, 15, 6, 1]
# # ]
# def is_prime?(num)
#     return false if num.even?
#     (2...num).all? { |i| num % i != 0 }
# end

def power_of_two?(number)
    return true if Math.log2(number) % 1 == 0
    false
end

def mersenne_prime(n)
    arr = []
    count = 2
    while arr.length < n 
        arr << count if Prime.instance.prime?(count) && power_of_two?(count + 1)
        count += 1
    end
    arr.last
end
# p mersenne_prime(1) # 3
# p mersenne_prime(2) # 7
# p mersenne_prime(3) # 31
# p mersenne_prime(4) # 127
# p mersenne_prime(6) # 131071

def triangular_number?(number)
    arr = []
    (1...number).each do |i|
         arr << (i * (i + 1)) / 2
    end
    return true if arr.include?(number)
    false
end

def word_numbers(word) #string return number
    alphabet = ("a".."z").to_a 
    index_arr = [] 
    word.each_char do |char|
        index_arr << alphabet.index(char) + 1 #plus 1, because index starts at 0.
    end
        index_arr.sum
end

def triangular_word?(word) #string
    return true if triangular_number?(word_numbers(word)) 
    false 
end
# p triangular_word?('abc')       # true
# p triangular_word?('ba')        # true
# p triangular_word?('lovely')    # true
# p triangular_word?('question')  # true
# p triangular_word?('aa')        # false
# p triangular_word?('cd')        # false
# p triangular_word?('cat')       # false
# p triangular_word?('sink')      # false

def collapse(nums)
    binding.pry
    (0...nums.length - 1).each do |idx|
        if nums[idx] + 1 == nums[idx + 1] || nums[idx] == nums[idx + 1] + 1
            return nums[0...idx] + nums[idx + 2..-1]
        end
    end
    nums
end

def consecutive_collapse(numbers)
    numbers.each { numbers = collapse(numbers) }
    numbers
end
# p consecutive_collapse([3, 4, 1])                     # [1]
# p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
# p consecutive_collapse([9, 8, 2])                     # [2]
# p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
# p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
# p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
# p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
# p consecutive_collapse([13, 11, 12, 12])              # []
def is_prime?(num)
    return nil if num < 2
    (2...num).all? { |i| num % i != 0 }
end

def positive_prime(num, n)
    count = 0
    # so everything counts right add 1 if origin number is already prime
    if is_prime?(num)
    new_number =  num + 1
    else
        new_number = num 
    end
    
    for_new_arr = []
    
    while count < n 
        if is_prime?(new_number) 
            for_new_arr << new_number 
            count += 1 #add prime numbers to the array and plus count if new_number is prime
        end
        new_number += 1
    end
    for_new_arr.last#take last in array
end 

def pretentious_primes(arr, n)
    new_arr = []
    if n.positive? #positive_prime
        arr.each { |num| new_arr << positive_prime(num, n) }
    else  #negative_prime
        arr.each  { |num| new_arr << negative_prime(num, n) }
    end
    new_arr
end

def negative_prime(num, n)
    count = 0
    # so everything counts right add 1 if origin number is already prime
    if is_prime?(num)
    new_number =  num - 1
    else
        new_number = num 
    end
    
    for_new_arr = []
    
    while count > n 
        return nil if new_number < 2 # if less then 2 just stop the loop and return
        if is_prime?(new_number) 
            for_new_arr << new_number 
            count -= 1 #add prime numbers to the array and minus count if new_number is prime
        end
        new_number -= 1
    end
    for_new_arr.last#take last in array
end
p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]

#pretentious prime better solution 
def next_prime(number, i)
    step = 1
    if i < 0
        i = -(i)
        step = -(step)
    end

    prime_count = 0
    while prime_count < i
        return nil if number < 0
        number += step
        prime_count += 1 if prime?(number)
    end
    number
end

def pretentious_primes(numbers, n)
    numbers.map { |num| next_prime(num, n) }
end


  