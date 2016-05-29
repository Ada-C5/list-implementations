# Implementation of a list using a Native array --> ruby does this automatically

class ArrayList
  def initialize
    @storage = [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil]
    @size = 0
  end

  def add(value)
    @storage[@size] = value
    @size += 1
  end

  def delete #last value
    @size -= 1
  end

  def display
    @size.times do |index|
      puts @storage[index]
    end
  end

  def include?(value)
    @size.times do |index|
      if @storage[index] == value
        return true
      end
    end
    return false
  end

  def size
    return @size
  end

  def max
    max = 0
    @size.times do |index|
      if @storage[index] > @storage[max]
        max = index
      end
    end
    return @storage[max]
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
