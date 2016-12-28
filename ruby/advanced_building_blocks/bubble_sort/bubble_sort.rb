def bubble_sort(arr)
	n = arr.length
	(n-1).times do 				# We must repeate n-1 times the action. The worst case scenario if our array in reverse order, in that case we need to move each item n-1 times to get the first element to the last place.
		index = 0 				# An index variable to keep track of the current position of the examined item.

		while index < arr.length-1 	# A while loop to send through the given item to the last place.
			num = arr[index] 		# That is the given item, the index number continously incriesing till this number reaches the end of the array.
			spaceship = (num <=> arr[index+1]) 	# The spaceship operator where we compare the given number with the following number. Returns positive, negativ or 0.
			
			if spaceship.to_i > 0 			# When the returned value is positive.
				arr[index] = arr[index+1] 	# Swap the 2 numbers with the help of their position in the array.
				arr[index+1] = num 			# This is why I needed a seperate variable of the current number, I just defined the new number for this position in the previous line.
				index += 1 					# When finished with the swap, increase the index number so we can check the following pair of numbers too.
			else
				index += 1 					# When no swap happened, still need to increase to check the following pair of numbers.
			end
		
			if index == arr.length 			# Index number will reach the length of arr, the while loop will stop, when we sent through 1 number of the array.
				index = 0 					# In order to start again with the other number what may got tho the first place to the array we set index to 0, and the loop starts again with the changed order of numbers.
			end
		end
	end
	print arr
end

bubble_sort([4,3,78,2,0,2])

def bubble_sort_by(arr, &block) 		# This one accepts a block as parameter.
	n = arr.length
	(n-1).times do
		index = 0

		while index < arr.length-1
			num = arr[index]
			spaceship = block.call(num, arr[index+1]) 		# When we call the block, also pass the current number(as left) and the following number(as right) as parameters.
															# It works the same apart from this line.
			if spaceship.to_i > 0
				arr[index] = arr[index+1]
				arr[index+1] = num
				index += 1
			else
				index += 1
			end
		
			if index == arr.length
				index = 0
			end
		end
	end
	print arr
end

bubble_sort_by(["hi","hello","hey"]) do |left,right|
    left.length - right.length
end