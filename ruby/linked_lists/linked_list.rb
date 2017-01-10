


class Node

	attr_accessor :value, :next_node

	def initialize(value, next_node=nil)
		@value = value
		@next_node = next_node
	end

end


class LinkedList < Node

	def initialize
		@list = []
	end

	def append(val, *node)
		@list << Node.new(val, *node)
#		@list[-1][@next_node] = self
	end
	
	def prepend(val)
		@list.unshift(Node.new(val, @list[0]))
	end

	def size
		@list.size
	end

	def head
		@list[0]
	end

	def tail
		@list[-1]
	end

	def at(index)
		@list[index]
	end

	def pop
		@list.pop
	end

	def contains?(value)
		@list.each do |x|
			if x.value == value
				return true
			end
		end
		false
	end

	def find(data)
		y = 0
		@list.each do |x|
			if x.value == data
				return y
			end
			y += 1
		end
		nil
	end

	def to_s
		@list.each do |x|
			print "( #{x} ) -> "
		end
		print "nil"
	end

	def show
		print @list
	end
	
end


mylist = LinkedList.new
mylist.append("Bob")
mylist.prepend("Chris")
mylist.prepend("Emma")
mylist.append("Lili")
mylist.show
puts ""
puts mylist.size
puts mylist.head
puts mylist.tail
puts mylist.at(2)
puts mylist.pop
puts mylist.size
mylist.show
puts ""
puts mylist.contains?("Bo")
puts mylist.find("Emma")
mylist.to_s