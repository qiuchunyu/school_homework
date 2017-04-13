class Node
	attr_accessor :data, :next, :prev
	
	def initialize(data)
		@data = data
		@next = nil
	end
end