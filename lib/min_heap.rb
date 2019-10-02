class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap

  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: 0(log n)
  # Space Complexity: 0(1)
  def add(key, value = key)
    @store.append(HeapNode.new(key, value))
    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: 0(log n)
  # Space Complexity: 0(1) 
  def remove()
    return if @store.empty?
    swap(0, @store.length - 1)
    removed_node = @store.pop
    heap_down(0)
    return removed_node.value
  end


  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"
      
    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: O(1) 
  # Space complexity: O(1) 
  def empty?
    return @store.empty?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(log n)
  # Space complexity: O(1)
  def heap_up(index)
    return if index == 0
    until index == 0 || @store[index].key >= @store[((index - 1) / 2)].key
      parent_index = (index - 1) / 2
      swap(index, parent_index) if @store[parent_index].key > @store[index].key
      index = parent_index
    end
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    left = (2 * index) + 1
    right = (2 * index) + 2
    if !@store[left] && !@store[right]
      return 
    elsif !@store[right]
      min = left
    else
      min = [left, right].min_by {|x| @store[x].key}
    end
    swap(index, min)
    heap_down(min)
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end