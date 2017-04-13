require_relative './node'

class SinglyLinkedList
	attr_accessor :head, :tail
	
	def initialize(data)
		@head = Node.new(data)
		@head.next = nil
		@tail = @head
	end
	
	def add(data)
		@tail.next = Node.new(data)
		@tail = @tail.next
		@tail.next = nil
	end
	
	def delete_middle
		if @head.nil?
			puts 'This is an empty singly linked list'
		elsif @head.next.nil?
			puts 'Only one node in the list, removing now...'
			@head = @head.next
		else
			current = @head.next
			middle = @head
			previous = nil
			while !current.next.nil? && !current.next.next.nil?
				previous = middle
				middle = current
				current = current.next
			end
			previous.next = current
	 end
	end
	
	def find(data) #how should we find the node? by data it's holding? This requires each node to have unique data
		current_node = @head
		while current_node != nil
			if current_node.data == data
				return current_node
			else
				current_node = current_node.next
			end
		end
	end

end