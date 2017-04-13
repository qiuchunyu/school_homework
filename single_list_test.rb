require 'rspec'
require 'pry'
require_relative './singly_linked_list'

describe 'Singlely Linked List' do
	
	context 'Check data in singly linked list' do
		before (:each) do
			@linkedlist = SinglyLinkedList.new(1)
		end
		
		it 'is added at the tail of the list' do
			@linkedlist.add(6)
			expect(@linkedlist.tail.data).to eq(6)
		end
		
		it 'delete the only element from the list, no deletes middle elements data for empty list' do
			@linkedlist.delete_middle # delete the only element in the list
			@linkedlist.delete_middle
			expect(@linkedlist.head).to eq(nil)
		end
		
		it 'no deletes middle elements data for empty list' do
			@linkedlist.delete_middle
			expect(@linkedlist.head).to eq(nil)
		end
		
		it 'deletes middle elements data with odd number of nodes in the list' do
			@linkedlist.add(2)
			@linkedlist.add(3)
			@linkedlist.add(4)
			@linkedlist.add(5)
			@linkedlist.delete_middle
			expect(!@linkedlist.find(3))
		end
		
		it 'deletes (n/2 -1)th data with even number of nodes in the list' do
			@linkedlist.add(2)
			@linkedlist.add(3)
			@linkedlist.add(4)
			@linkedlist.delete_middle
			expect(!@linkedlist.find(2))
		end
	
	end
end