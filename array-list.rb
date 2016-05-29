# Implementation of a list using a Native array --> ruby does this automatically

class ArrayList
  def initialize
    @storage = [nil,nil,nil,nil,nil]
    @size = 0
    # capacity is 5 - but content is 0. there isn't anything occupying the available memory.
  end

  def add(value)
    @storage[@size] = value
    @size += 1
  end

  # always deletes last value in collection
  def delete
    @size -= 1
    # ignore the last spot/ decrease the size by 1/ "ignore this item"
  end

  def display
    @size.times do |i|
       puts @storage[i]
    end
  end

  def include?(key)
    @size.times do |i|
      if @storage[i] == key
        return true
      end
    return false
  end

  def size
    @size
  end

  def max
    return nil if empty?
    biggest = 0
    @size.times do |i|
      if @storage[i] > @storage[biggest]
        biggest = i
      end
    end
    @storage[biggest]
  end

  def empty?
    @size == 0
  end

end

# Initializing an Array List
arr = ArrayList.new

# Adding Elements to Array List
arr.add(10)
arr.add(20)

# Display the Array List
puts "Displaying Array List:"
arr.display

puts "Delete 10 and then display the array list:"
arr.delete(10)
arr.display
