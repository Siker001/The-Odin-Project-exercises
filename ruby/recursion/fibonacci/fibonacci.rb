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
