
module Enumerable
    
    def my_each
        i = 0

        while i < self.length                          # Basic iterating through an array. Self represents the array. i represents the index number of current element of the array.
        	yield(self[i]) if block_given?             # Elegantly cheking if block is given. If not, the block does not run, just self returns.
        	i += 1                                     # Yield represents the passed in block.
        end
        self
    end

    def my_each_with_index
    	i = 0

    	while i < self.length
    		yield(self[i], i) if block_given?
    		i += 1
    	end
    	self
    end

    def my_select
    	result = []
    	self.my_each do |x|
    		if (yield(x) == true)
    			result << x
    		end
    	end
    	result
    end

    def my_all?
    	result = false
    	self.my_each do |x|
    		if (yield(x) != true) 
    			return false
    		else
    			result = true
    		end
    	end
    	result
    end

    def my_any?
    	result = true
    	self.my_each do |x|
    		if (yield(x) == true) 
    			return true
    		else
    			result = false
    		end
    	end
    	result
    end

    def my_none?
    	result = false
    	if block_given?
	    	self.my_each do |x|
	    		if (yield(x) == true) 
	    			return false
	    		else
	    			result = true
	    		end
	    	end
    	elsif self == []                   # These are the exeptions according to what they need to return when given these type of data.
    		result = true
    	elsif self.my_all? { |x| ((x == nil) || (x == false)) }
    		result = true
    	else
    		result = false
    	end
    	result
    end

    def my_count(par)
    	result = 0
    	check_this = []
    	if (self.is_a? String) 		# This should work with strings but it does not. Something to do with that enumerable methods are not part of String class.
    		return check_this = self.split("")    # I was cheking if self is a string, if so split it and push it into an array.
    	else
    		check_this = self
    	end
    	check_this.my_each do |x|
    		if (x == par)                 # going through each element of array and compare it with parameter, if true, counter goes up by one.
    			result += 1
    		end
    	end
    	result
    end

    def my_map(&proc)                   # Can accept a proc also with the help of & and argument.
        result = []
        self.my_each do |x|                  # Iterating through each item of self.
            if (proc != nil)                   # When proc is sent map uses it.
                result << proc.call(x)          # Call proc on given array element and push it to result array.
            elsif block_given?                  # In case of no proc given but block is given.
                result << yield(x)              # The x is sent to block and the returned value pushed to result.
            else
             result << x                        # When no proc and no block given, only x is sent to result array as it is.
            end
        end                                                     
        result
    end

    def my_inject
        first = self[0]
        total = self[0]
        self.shift
        rest = self
        rest.each do |x|
            total = yield(total, x)
        end
        self.unshift(first)
        total
    end

    def multiply_els
        self.my_inject { |total, item| total * item }
    end

end
