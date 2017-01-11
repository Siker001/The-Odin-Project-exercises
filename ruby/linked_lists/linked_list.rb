


class Node

	attr_accessor :value, :next

	def initialize(value)
		@value = value
		@next = nil
	end

end


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
=begin
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
=end
	def show
		x = @head
		until x == nil
			print x.value
			puts ""
			x = x.next
		end
	end

	

end


mylist = LinkedList.new
mylist.append("Bob")
mylist.append("Chris")
mylist.prepend("Emma")
mylist.append("Lili")
mylist.append("Carmen")
mylist.show
mylist.size
=begin

mylist.show
puts ""
puts mylist.size
puts mylist.head
puts mylist.tail
puts mylist.at(2)
puts mylist.pop

mylist.show
puts ""
puts mylist.contains?("Bo")
puts mylist.find("Emma")
mylist.to_s
=end