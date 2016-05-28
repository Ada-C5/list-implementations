# Implementation of a list using a Native array --> ruby does this automatically

class ArrayList
  def initialize
    @storage = [nil,nil,nil,nil,nil] #storage capacity
      #this array has a capacity of 5, but nothing is in it, so the size is 0
      #sample = []
      #[].size = 0, however ruby on the down low created [nil,nil,nil,nil] just to save memory for it
    @size = 0 #this is what we think is actually in the array
  end

  def add(value) #add to the end
    @storage[@size] = value
    @size += 1
  end

  def delete(value)
    #@storage[@size] = nil
    @size -= 1
  end

  def display #print out all the values that are actually a thing, so only up to size.
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
        biggest i
      end
    end
      return @storage[biggest]
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
