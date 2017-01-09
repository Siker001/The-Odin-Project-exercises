
def merge_sort(arr)
	if arr.length == 1
		return arr
	else
		n = arr.size-1
		merge(merge_sort(arr[0..n/2]), merge_sort(arr[(n/2)+1..n]))
	end
end

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
