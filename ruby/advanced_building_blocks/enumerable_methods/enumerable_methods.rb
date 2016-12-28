# ruby 2.3.0

module Enumerable
    
    def my_each
        i = 0

        while i < self.length
        	yield(self[i]) if block_given?
        	i += 1
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
    	elsif self == []
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
    		return check_this = self.split("")
    	else
    		check_this = self
    	end
    	check_this.my_each do |x|
    		if (x == par)
    			result += 1
    		end
    	end
    	result
    end

end

