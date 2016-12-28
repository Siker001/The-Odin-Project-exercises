def bubble_sort(arr)
	n = arr.length
	(n-1).times do
		index = 0

		while index < arr.length-1
			num = arr[index]
			spaceship = (num <=> arr[index+1])
			
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

bubble_sort([4,3,78,2,0,2])

def bubble_sort_by(arr, &block)
	n = arr.length
	(n-1).times do
		index = 0

		while index < arr.length-1
			num = arr[index]
			spaceship = block.call(num, arr[index+1])
			
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