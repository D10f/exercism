class Node

  attr_accessor :value, :left, :right, :parent
  
  def initialize(value, left = nil, right = nil)
    self.value = value
    self.left  = left
    self.right = right

    if not self.left.nil?
      self.left.parent = self
    end

    if not self.right.nil?
      self.right.parent = self
    end
  end

  def ==(other_node)
    self.value == other_node.value
  end
end

class Zipper

  attr_reader :root, :node
  
  def self.from_tree(root)
    Zipper.new(root)
  end

  def to_tree
    self.root
  end

  def value
    self.node.value
  end

  def set_value(new_value)
    self.node.value = new_value
    Zipper.new(root, self.node)
  end

  def set_left(new_node)
    self.node.left = new_node
    Zipper.new(root, self.node)
  end

  def set_right(new_node)
    self.node.right = new_node
    Zipper.new(root, self.node)
  end

  def left
    if self.node.left
      Zipper.new(root, self.node.left)
    else
      nil
    end
  end

  def right
    Zipper.new(root, self.node.right)
  end

  def up
    if self.node == self.root
      nil
    else
      Zipper.new(root, self.node.parent)
    end
  end

  def ==(other_zipper)
    self.node.value = other_zipper.node.value
  end

  private

  attr_writer :root, :node

  def initialize(root, node = root)
    self.root = root
    self.node = node
  end

end