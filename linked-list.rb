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
           full_list << current.value.to_s
           current = current.next_node
       end
       full_list += [current.value.to_s]
       puts full_list.join("->")
   end

# doing while current.next_node != nil prevent code from ever looking
# at the last node, so they wouldn't get evaluated using the pattern above
   def include?(key)
    current = @head
    while current != nil 
      return true if current.value == key
      current = current.next_node
    end
    return false
   end

   def size
    @size = 0
    current = @head
    while current != nil
      @size += 1
      current = current.next_node
    end
    return @size
   end

   def max
    current = @head
    maximum = current.value
    while current != nil
      if current.value > maximum
        maximum = current.value
      end
      current = current.next_node
    end
    return maximum
   end

end

# Initializing a Linked List with a node containing value (5)
ll = LinkedList.new(5)

# Adding Elements to Linked List
ll.add(10)
ll.add(20)

# Crystal - I added a few more to test my max method
ll.add(65)
ll.add(2)
ll.add(6)

# Crystal - these were my tests for include?, size, and max methods
puts ll.include?(10) # true (passes)
puts ll.include?(4) # false (passes)
puts ll.size # 6 (passes)
puts ll.max # 65 (passes)


# Display the Linked List
puts "Displaying Linked List:"
ll.display

puts "Delete 10 and then display the linked list:"
ll.delete(10)
ll.display



# Output:
# Initialized a Node with value:  5
# Initialized a Node with value:  10
# Initialized a Node with value:  20
# Displaying Linked List:
# 5->10->20
# Delete 10 and then display the linked list:
# 5->20

