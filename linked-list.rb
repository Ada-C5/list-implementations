# Quick Example of a Self Referential Data Structure in Ruby
# NODE -> contains a value and a pointer to (next_node)
# LinkedList -> This class holds the linked list functions - adding a node, traversing and displaying the linked list

class Node
   attr_accessor :value, :next_node

   def initialize(val,next_in_line=nil)
       @value = val
       @next_node = next_in_line
       puts "Initialized a Node with value:  " + value.to_s
   end
end

class LinkedList
   def initialize(val)
       # Initialize a new node at the head
       @head = Node.new(val,nil)
   end

   def add(value)
       # Traverse to the end of the list
       # And insert a new node over there with the specified value
       current = @head
       while current.next_node != nil
           current = current.next_node
       end
       current.next_node = Node.new(value,nil)
       self
   end

   def delete(val)
       current = @head
       if current.value == val
           # If the head is the element to be delete, the head needs to be updated
           @head = @head.next_node
       else
           # ... x -> y -> z
           # Suppose y is the value to be deleted, you need to reshape the above list to :
           #   ... x->z
           # ( and z is basically y.next_node )
           current = @head
           while (current != nil) && (current.next_node != nil) && ((current.next_node).value != val)
               current = current.next_node
           end

           if (current != nil) && (current.next_node != nil)
               current.next_node = (current.next_node).next_node
           end
       end
   end

   def display
       # Traverse through the list till you hit the "nil" at the end
       current = @head
       full_list = []
       while current.next_node != nil
           full_list += [current.value.to_s]
           current = current.next_node
       end
       full_list += [current.value.to_s]
       puts full_list.join("->")
   end

   def include?(key)
     current = @head
    #while we have nodes to traverse
     while current != nil
     #when we find the key
       return true if current.value == key
       #reassign currrent
       current = current.next_node
     end
     puts "The list does not include #{key}"
     return false
   end

   def size
    @size = 0
    current = @head
     while current != nil
       #increase size
       @size += 1
       #reassign current
       current = current.next_node
     end
    puts "This linked list has #{@size} elements."
    return @size
   end

   def max
     current = @head
     max_value = current.value
      while current != nil
        #if the current node has a larger value than the max gets reasigned
        if current.value > max_value
          max_value = current.value
        end
        #if max_value is larger than keep moving to check next node
        current = current.next_node
      end
      puts "#{max_value} is the max value element in the list."
      return max_value
   end
end

# Initializing a Linked List with a node containing value (5)
ll = LinkedList.new(5)

# Adding Elements to Linked List
ll.add(10)
ll.add(20)
# add more to list
ll.add(11)
ll.add(99)

# Display the Linked List
puts "Displaying Linked List:"
ll.display
ll.include?(5)
# add more to test include?
ll.include?(11)
ll.include?(98)
ll.size
ll.max


puts "Delete 10 and then display the linked list:"
ll.delete(10)
ll.display
ll.size
ll.max



=begin
Output:
Initialized a Node with value:  5
Initialized a Node with value:  10
Initialized a Node with value:  20
Displaying Linked List:
5->10->20
Delete 10 and then display the linked list:
5->20
=end
