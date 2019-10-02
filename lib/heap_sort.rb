

# This method uses a heap to sort an array.
# Time Complexity: 0(n log n)
# Space Complexity: 0(1)
def heap_sort(list)
  heap = heapify(list)
  until heap.empty?
    element = heap.remove()
    list.append(element)
  end
  return list
end

def heapify(list)
  heap = MinHeap.new()
  until list.empty?
    element = list.pop()
    heap.add(element)
  end
  return heap
end
