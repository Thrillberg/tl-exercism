class Node
  include Comparable

  attr_accessor :left, :right, :value

  def initialize(value)
    @value = value
  end

  def <=>(other)
    self.value <=> other.value
  end

  def insert(node)
    if node < self
      if !left
        self.left = node
      else
        left.insert(node)
      end
    elsif node > self
      if !right
        self.right = node
      else
        right.insert(node)
      end
    else

    end
  end

  def include?(node)
    if node < self
      return false unless left
      left.include?(node)
    elsif node > self
      return false unless right
      right.include?(node)
    else
      return true
    end
  end

  def display
    left.display if left
    puts self.value
    right.display if right
  end
end

class BSTree
  attr_accessor :root

  def initialize(val)
    @root = Node.new(val)
  end

  def insert(val)
    new_node = Node.new(val)
    root.insert(new_node)
  end

  def include?(val)
    node = Node.new(val)
    root.include?(node)
  end

  def display
    root.display
  end
end

tree = BSTree.new(10)
tree.insert(15)
tree.insert(5)

puts tree.include?(5)

tree.display
