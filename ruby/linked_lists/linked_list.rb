# Creates a node when called by initializing value and pointing to next.
class Node

	attr_accessor :value, :next

	def initialize(value)
		@value = value
		@next = nil
	end

end

# Creating a list with first and last element, also with size.
class LinkedList < Node

	attr_accessor :name

	def initialize
		@head = nil
		@tail = nil
		@size = 0
	end

	def append(val)
		node = Node.new(val)
		if @head == nil
			@head = node
		elsif @tail == nil
			@head.next = node
			@tail = node
		else
			@tail.next = node
			@tail = node
		end
		@size += 1
	end
	
	def prepend(val)
		node = Node.new(val)
		if @head == nil
			@head = node
		else
			node.next = @head
			@head = node
		end
		@size += 1
	end

	def size
		puts @size
	end

	def head
		@head
	end

	def tail
		@tail
	end

# Iterating through the list by going head to tail, increasing y as index number.
# When y equals with given index number, returns current node.
	def at(index)
		x = @head
		y = 0
		until x == nil
			if y == index
				return x
			end
			y += 1
			x = x.next
		end
	end

	def pop
		if @size > 1
			if @head.next == @tail
				@head.next = nil
			else
				@tail = at(@size-2)
				@tail.next = nil
			end
		end
		@size -= 1
	end

	def contains?(value)
		x = @head
		until x == nil
			if x.value == value
				return true
			end
			x = x.next
		end
		false
	end

	def find(data)
		y = 0
		x = @head
		until x == nil
			if x.value == data
				return y
			end
			y += 1
			x = x.next
		end
		nil
	end

	def to_s
		x = @head
		until x == nil
			print "( #{x.value} ) -> "
			x = x.next
		end
		print "nil"
		puts ""
	end

	def insert_at(index, data)
		node = Node.new(data)
		node.next = at(index)
		at(index-1).next = node
		@size += 1
	end

	def remove_at(index)
		at(index-1).next = at(index+1)
		@size -= 1
	end

	def show
		x = @head
		until x == nil
			print x.value
			puts ""
			x = x.next
		end
	end

end

# My checklist methods.
=begin
mylist = LinkedList.new
mylist.append("Bob")
mylist.append("Chris")
mylist.prepend("Emma")
mylist.append("Lili")
mylist.append("Carmen")
mylist.show
mylist.size
puts mylist.head.value
puts mylist.tail.value
puts mylist.at(2).value
puts mylist.pop
mylist.show
puts mylist.contains?("Lili")
puts mylist.find("Carmen")
mylist.to_s
mylist.insert_at(2, "Bla")
mylist.to_s
mylist.remove_at(3)
mylist.to_s
=end