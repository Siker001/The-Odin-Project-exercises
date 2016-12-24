# Getting an array of numbers which representing the stock prices. We want to buy on the lowest price and sell at the highest.
# I'm looping through every pairs and searching for the biggest difference which is the smallest number since it might even be negative.

def stock_picker(prices)
	# Storing variables what I use later
	$d = 0
	$small = 0
	$big = 0
	prices.each do |x|			# iterating through all prices elements
		y = prices.index(x)+1 	# y is the next element in prices array
		while y < (prices.length)	# it runs till we have something in the array
			if (x-prices[y]) < $d 	# only runs when the difference of x element and the next one is lower than the previous pair's (which is stored in $d)
				$d = x-prices[y] 	# so we store the lowest difference in $d
				$small = prices.index(x) 	# we store in $small the index number of x in the array, that is the day when we need to buy, the lowest price
				$big = y 					# y is the index number in the array of the number, which is the highest, and have the biggest difference with x
				y += 1 						# add +1 to y so we can loop through the array
			else
				y += 1 						# if the difference of the following pair is not smaller than the previous ones then we just move on and don't change $small and $big and $d
			end
		end
	end
	result = []
	result.push($small, $big) 			# pushing the results into result array
	puts result
end




stock_picker([17,3,6,9,15,8,6,1,10])