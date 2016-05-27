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

  # HOMEWORK: next 3 methods
  def include?(key)
    current = @head
    while current.next_node != nil
      return true if current.value == key
      current = current.next_node
    end

    return true if current.value == key

    false
  end

  def size
    current = @head
    list_size = 0
    while current.next_node != nil
      list_size += 1
      current = current.next_node
    end

    list_size += 1
  end

  # optional
  def max
    current = @head
    max = 0
    while current.next_node != nil
      max = current.value if current.value > max
      current = current.next_node
    end

    max = current.value if current.value > max
    max
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

puts "Delete 10 and then display the linked list:"
ll.delete(10)
ll.display

print "Checking if 5 is included in the linked list: "
puts ll.include?(5)

print "Checking if 10 is included in the linked list: "
puts ll.include?(10)

print "Checking the size of the linked list: "
puts ll.size

ll.add(12)
puts "New size: #{ll.size}"

ll.display

print "Max value of any node is: "
puts ll.max

=begin
Output:
Initialized a Node with value:  5
Initialized a Node with value:  10
Initialized a Node with value:  20
Displaying Linked List:
5->10->20
Delete 10 and then display the linked list:
5->20
Checking if 5 is included in the linked list: true
Checking if 10 is included in the linked list: false
Checking the size of the linked list: 2
Initialized a Node with value:  12
New size: 3
5->20->12
Max value of any node is: 20
=end
