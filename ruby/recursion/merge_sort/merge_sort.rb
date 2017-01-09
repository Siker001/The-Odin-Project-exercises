# Merge sorting method in 2 parts.
# First we split the array into half with recursion till we have only 1 element in array.
# The whole recusive method for both half goes under merge method as 2 parameters.
def merge_sort(arr)
	if arr.length == 1
		return arr
	else
		n = arr.size-1
		merge(merge_sort(arr[0..n/2]), merge_sort(arr[(n/2)+1..n]))
	end
end

# Merge method compares the 2 parameters passed into it.
# Until one of the parameters array.length becomes 0, the comparison will run.
# If left array's first element is smaller than right's then remove it from the array, store it in smaller variable.
# Then push this into result array.
# This loops until one of the array runs out of elements.
# Which point array concatination happens and we just add them all together. Since they are sorted.
def merge(left, right)
	result = []
	until left.length == 0 || right.length == 0
		smaller = left[0] <= right[0] ? left.shift : right.shift 
		result << smaller
	end
	result + left + right
end

print merge_sort([2,32,15,5,81,12,45,9,1])
puts ""
