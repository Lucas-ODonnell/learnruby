def fib(n)
    fib = [0, 1]
    count = n - 2 
    count.times do
        fib << fib[-1] + fib[-2]
    end
    fib
end

def rec_fib(n)
	return [0] if n == 1
	return [0, 1] if n == 2
    rec_fib(n - 1) << (rec_fib(n - 1)[-1] + rec_fib(n - 1)[-2])
end