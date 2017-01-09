# Looping through n-1 times, and adding the last two values of the array together.
# This gives the fibonacci sequence at the end.
def fib(arg)
	answ = []
	if arg == 0
		answ << 0
	elsif arg == 1
		answ = [0,1]
	else
		answ = [0,1]
		(arg-1).times do
			answ << answ[-1] + answ[-2]
		end
	end
	print answ
	puts ""
end

fib(0)
fib(1)
fib(2)
fib(3)
fib(4)
fib(5)
fib(6)
fib(7)
fib(10)

# This is a recursive method to print out the fibonacci sequence.
# Accepts and needs 1srt(i), 2nd(j) value, a counter(cnt) and n as how many fibonacci numbers we would like from the sequence.
# When method runs more than n, it returns with the last number of the fibonacci sequence.
# Add 1st and 2nd number together, you get the 3rd one like this. Which will become the 2nd number in the next method.
# As the current 2nd will be set to be the 1st number in the next method.
# Also counter increses by one, and n stays the same.
def fibs_rec(i, j, cnt, n)
    if(cnt > n)
       return i
    else
       k = i + j
       print i, ", "
       i = j
       j = k
       fibs_rec(i, j, cnt += 1, n)
    end
end

fibs_rec(0, 1, 0, 0)
puts ""
fibs_rec(0, 1, 0, 1)
puts ""
fibs_rec(0, 1, 0, 2)
puts ""
fibs_rec(0, 1, 0, 3)
puts ""
fibs_rec(0, 1, 0, 4)
puts ""
fibs_rec(0, 1, 0, 5)
puts ""
fibs_rec(0, 1, 0, 6)
puts ""
fibs_rec(0, 1, 0, 7)
puts ""
fibs_rec(0, 1, 0, 10)
puts ""
