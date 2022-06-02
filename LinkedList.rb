class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  def append(node)
    # Adds a node to the end of the list
    if @head.nil? # Checks if list is empty
      @head = node
    else
      @tail.next_node = node
    end
    @tail = node
  end

  def prepend(node)
    # Adds a node to the beginning of the list
    if @head.nil?
      @tail = node
    else
      node.next_node = @head
    end
    @head = node
  end

  def size
    return 0 if @head.nil?

    # loops through each node, counting them up
    count = 1
    current_node = @head
    loop do
      return count if current_node.next_node.nil?

      count += 1
      current_node = current_node.next_node
    end
  end

  def head
    return 'Empty list' if @head.nil?

    @head
  end

  def tail
    return 'Empty list' if @head.nil?

    @tail
  end

  def at(index)
    return 'Empty list' if @head.nil?

    count = 0
    current_node = @head
    loop do
      return current_node if count == index

      current_node = current_node.next_node
      count += 1
    end
  end

  def pop
    return 'Empty list' if @head.nil?

    current_node = @head
    loop do
      if current_node.next_node == @tail
        @tail = current_node
        @tailnext_node = nil
        break
      end
      current_node = current_node.next_node
    end
  end

  def contains?(value)
    return 'Empty list' if @head.nil?

    current_node = @head
    loop do
      return true if current_node.value == value

      current_node = current_node.next_node
    end
    false
  end

  def find(value)
    return 'Empty list' if @head.nil?

    count = 0
    current_node = @head
    loop do
      return count if current_node.value == value

      current_node = current_node.next_node
      count += 1
    end

    nil
  end

  def to_s
    return 'Empty list' if @head.nil?

    string = ''
    current_node = @head
    for i in 0..self.size-1 do
      string << "(#{current_node.value}) -> "
      current_node = current_node.next_node
    end
    string << 'nil'
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
end

list = LinkedList.new
node = Node.new(3)
node2 = Node.new(2)
node3 = Node.new(5)
node4 = Node.new(7)

list.append(node)
list.append(node2)
list.append(node3)
list.append(node4)

puts list
