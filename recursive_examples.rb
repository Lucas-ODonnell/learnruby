def add(n)
   if n == 1
    return n
   end
   n + add(n - 1)
 end

 #add(10) => 55
 # 10 + (10 - 1) = 19, 9 + (9 - 1) = 17, 8 + (8 - 1) = 15
 # 7 + (7 - 1) = 13, 6 + (6 - 1) = 11, 5 + (5 - 1) = 9, 4 + (4 - 1) = 7
 # 3 + (3 - 1) = 5, 2 + (2 - 1) = 3 n == 1 return n

 #3 + 5 + 7 + 9 + 11 + 13 + 15 + 17 + 19 = 99 which is wrong.

 def lucas_number(n)
    return 2 if n == 0  
    return 1 if n == 1
    lucas_number(n - 1) + lucas_number(n - 2)
end


#lucas_number(5)   # =>    11
# (5 - 1 = 4)  (5 - 2 = 3) (4 + 3 = 7)
# (4 - 1 = 3) (3 - 2 = 1)  (3+ 1 = 4)
# 1 + 3 + 3 + 4 = 11 yay! (7 + 4) = 11

# lucas_number(9)   # =>    76
#(9 - 1 = 8) (9 - 2 = 7) 8 + 7 = 15
#(8 - 1 = 7) (7 - 2 = 5) 7 + 5 = 12
#(7 - 1 = 6) (5 - 2 = 3) 6 + 3 = 9
#(6 - 1 = 5) (3 - 2 = 1) 5 + 1 = 6
#15 + 12 + 9 + 6 = 42 so wrong
#((5 - 1) = 4 (4 - 1) = 3 (3 - 1) = 2 (2 - 1) = 1) = 10
#42 + 10 != 76

# pow(2, 0) # => 1
# pow(2, 1) # => 2
# pow(2, 5) # => 32
# pow(3, 4) # => 81
# pow(4, 3) # => 64
def pow(base, exponent)
    return 1 if exponent == 0
    base * pow(base, exponent - 1)
end
 #this one I don't understand at all
 # pow(4, 3) exponent loops 3 times  to get to 0
 # 4*4*4 = 64 how does base * pow(base) itterate why isn't it base * base every loop?