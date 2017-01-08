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



def fibs_rec(arg, *val)
	answ = []
	
	if arg == 0
		answ << 0
		0
	elsif arg == 1
		answ << 1
		1
	else
		val = fibs_rec(arg-1)
		answ = val
		print ','
		val
		
	end
	print answ
end

fibs_rec(0)
puts ""
fibs_rec(1)
puts ""
fibs_rec(2)
puts ""
fibs_rec(3)
puts ""
fibs_rec(4)
puts ""
=begin
fibs_rec(5)
puts ""
print fibs_rec(6)
puts ""
print fibs_rec(7)
puts ""
print fibs_rec(10)
puts ""
=end