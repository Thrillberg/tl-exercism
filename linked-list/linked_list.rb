class Node
  attr_accessor :value, :next

  def initialize(val)
    @value = val
  end
end

class List
  attr_reader :tail, :head
  include Enumerable

  def initialize(*objs)
    nodes = []
    objs.each {|obj| nodes << Node.new(obj)}

    @tail = @head = nil

    return if nodes.empty?

    @head = nodes.first
    @tail = nodes.last

    nodes.each_with_index do |node, idx|
      node.next = nodes[idx + 1] unless idx == nodes.length - 1
    end
  end

  def empty?
    @tail.nil? && @head.nil?
  end

  def to_s
    "#{self.head}, #{self.tail}"
  end

  def size
    return 0 if empty?
    reduce(0) {|acc, _| acc += 1}
  end

  def to_a
    return [] if empty?
    reduce([]) {|acc, obj| acc << obj}
  end

  def append(obj)
    node = Node.new(obj)
    if empty?
      @tail = @head = node
    else
      @tail.next = node
      @tail = node
    end
  end
  alias_method :<<, :append

  def prepend(obj)
    node = Node.new(obj)
    if empty?
      @tail = @head = node
    else
      node.next = @head
      @head = node
    end
  end

  def display
    each {|value| puts value.inspect }
  end

  def select
    List.new(*super)
  end

  def each
    current_node = @head
    loop do
      yield(current_node.value)
      if current_node == @tail
        break
      else
        current_node = current_node.next
      end
    end
  end

  def each_node
    current_node = @head
    loop do
      yield(current_node)
      if current_node == @tail
        break
      else
        current_node = current_node.next
      end
    end
  end

  def delete_head
    return if empty?
    if size == 1
      @tail = @head = nil
      return
    end

    node = @head
    @head = @head.next
    node.next = nil
  end

  def delete_tail
    return if empty?
    if size == 1
      @tail = @head = nil
      return
    end

    each_node do |node|
      if node.next == @tail
        node.next = nil
        @tail = node
      end
    end
  end

  def ==(other)
    to_a.sort == other.to_a.sort
  end
end

class Deque
  def initialize
    @stack = List.new
  end

  def pop
    obj = @stack.tail
    @stack.delete_tail
    obj.value
  end

  def push(obj)
    @stack.append(obj)
  end

  def shift
    obj = @stack.head
    @stack.delete_head
    obj.value
  end

  def unshift(obj)
    @stack.prepend(obj)
  end

  def size
    @stack.size
  end
end

class Dequeue
  def initialize
    @queue = List.new
  end

  def enqueue(obj)
    @queue.prepend(obj)
  end

  def dequeue
    obj = @queue.tail
    @queue.delete_tail
    obj
  end

  def size
    @queue.size
  end
end

#list = List.new(1,2)
#list2 = List.new(2, 1)

#puts list == list2

#list.delete_head
#puts list.to_a.inspect

#list.display

#new_list = list.select {|value| value.odd?}

#puts "New List:"
#puts new_list.class
#new_list.display

