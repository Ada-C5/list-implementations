# Implementation of a list using a Native array --> ruby does this automatically

class ArrayList # Ruby's array is an ArrayList. We are simulating what a Ruby array does by showing what happens with the native array within the Ruby array.

  def initialize
    @storage = [nil,nil,nil,nil,nil] # this array has a capacity of 5
    @size = 0 # this is what we think is actually inside of this array
  end

  def add(value) # this is simulating push (<<)
    @storage[@size] = value
    @size += 1
  end

  # "deletes" last value
  def delete
    return nil if empty?
    @size -= 1
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
    end
    return false
  end

  def size
    return @size
  end

  def max
    return nil if empty?
    biggest = 0
    @size.times do |i|
      if @storage[i] > @storage[biggest]
        biggest = i
      end
    end
    return @storage[biggest]
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
