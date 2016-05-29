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
    # breaks out when we reach last instead of check last
    while current.next_node != nil
      return true if current.value == key
      current = current.next_node
    end
    return true if current.value == key
    return false
  end

  def size
    current = @head
    size = 1
    while current.next_node != nil
      size += 1
      current = current.next_node
    end
    size
  end

  def max
    current = @head
    max = [current]
    while current.next_node != nil
      current = current.next_node
      if current.value > max[0].value
        max[0] = current
      end
    end
    max[0] = current if current.value > max[0].value
    # i decided to return the node itself, and you can
    # call value on it to see its value
    max[0]
  end

end

# Initializing a Linked List with a node containing value (5)
ll = LinkedList.new(5)

# Adding Elements to Linked List
ll.add(10)
ll.add(20)

# Display the Linked List
puts "Displaying Linked List:"
ll.display

puts "Shows the max:"
puts ll.max.value

puts "Delete 10 and then display the linked list:"
ll.delete(10)
ll.display

puts "Shows the size:"
puts ll.size

puts "Shows the max:"
puts ll.max.value

ll.add(35)
ll.add(15)

puts "Displaying Linked List:"
ll.display

puts "Shows the max:"
puts ll.max.value

puts "Does it include 20?"
puts ll.include?(20)

puts "Does it include 35?"
puts ll.include?(35)

puts "Does it include 10?"
puts ll.include?(10)

puts "Does it include 5?"
puts ll.include?(5)

puts "Shows the size:"
puts ll.size


=begin
Output:
Initialized a Node with value:  5
Initialized a Node with value:  10
Initialized a Node with value:  20
Displaying Linked List:
5->10->20
Shows the max:
20
Delete 10 and then display the linked list:
5->20
Shows the size:
2
Shows the max:
20
Initialized a Node with value:  35
Initialized a Node with value:  15
Displaying Linked List:
5->20->35->15
Shows the max:
35
Does it include 20?
true
Does it include 35?
true
Does it include 10?
false
Does it include 5?
true
Shows the size:
4
=end
