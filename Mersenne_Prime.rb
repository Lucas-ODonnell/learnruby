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
p mersenne_prime(1) # 3
p mersenne_prime(2) # 7
p mersenne_prime(3) # 31
p mersenne_prime(4) # 127
p mersenne_prime(6) # 131071
