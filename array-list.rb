# Implementation of a list using a Native array --> ruby does this automatically

class ArrayList
  def initialize
    #This array has the capacity of five. When we tell Ruby Array.new (or we just throw up some brackets) Ruby goes and reserves space in memory for our Array. That is what we are trying to illustrate.
    # storage = capacity (what _could_ it hold)
    @storage = [nil, nil, nil, nil, nil]
    @size = 0
  end

  def add(value)
    #We are putting the value in the index that is equal to the size of the array. If the size is 0, the value goes into the zero index position.
    @storage[@size] = value
    @size += 1
  end

  def delete(value)
    return nil if empty?
    @size -= 1

    #We could do this, but we don't need to. @storage will always have 5 spots in it, we can just adjust the @size to reflect what we want to be in the array. We COULD delete the very last value, but don't NEED to.
    # @storage[@size] = nil
  end

  def display
    #Linearly we are printing each value within storage.
    @size.times do |i|
      puts @storage[i]
    end
  end

  def include?(key)
    @size.times do |i|
      if @storage[i] = key
        return true
      end
    end
    #This false is not, and should not be a part of the above if loop as an else. If it _were_ the loop would stop once it met the first not "key" value in the array.
    return false
  end

  def size
    return @size
  end

  def max
    # We start by assuming that the biggest value is 0. As we go through the array we check to see if each value is bigger that 0. If the value being passed through the loop is greater, then the value of biggest is replaced by the value.
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
arr.delete
arr.display
