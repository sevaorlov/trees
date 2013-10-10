class Node

  attr_accessor :key, :value, :left, :right, :color, :size

  def initialize(key, value, color)
    @key = key
    @value = value
    @color = color
    @size = 1
  end

end

class IntComparator

  def self.compare(key1, key2)
    if key1 < key2
      return -1
    elsif key1 > key2
      return 1
    else
      return 0
    end
  end

end

class RedBlackBST

  RED = true
  BLACK = false

  def initialize(comparator)
    @comparator = comparator
  end

  def treeRank(key)
    rank(key, @root)
  end

  def treeSize
    size @root
  end

  def put(key, value = nil)
    @root = putToNode(@root, key, value)
    @root.color = RED
    rank(key, @root)
  end

  private
  def isRed(node)
    return false if node.nil?
    node.color == RED
  end

  def putToNode(node, key, value)
    return Node.new(key, value, RED) if node.nil?

    cmp = @comparator.compare(key, node.key)

    if cmp < 0
      node.left = putToNode(node.left, key, value)
    elsif cmp > 0
      node.right = putToNode(node.right, key, value)
    else
      node.value = value
    end

    node = rotateLeft(node) if isRed(node.right) && !isRed(node.left)
    node = rotateRight(node) if isRed(node.left) && isRed(node.left.left)
    flipColors(node) if isRed(node.left) && isRed(node.right)

    node.size = size(node.left) + size(node.right) + 1

    node
  end

  def rotateLeft(node)
    newNode = node.right
    node.right = newNode.left
    newNode.left = node
    newNode.color = node.color
    node.color = RED
    newNode
  end

  def rotateRight(node)
    newNode = node.left
    node.left = newNode.right
    newNode.right = node
    newNode.color = node.color
    node.color = RED
    newNode
  end

  def flipColors(node)
    node.color = RED
    node.left.color = BLACK
    node.right.color = BLACK
  end

  def size(node)
    return 0 if node.nil?
    node.size()
  end

  # returns number of keys less than key in subtree at node
  def rank(key, node)

    return 0 if node.nil?

    cmp = @comparator.compare(key, node.key)

    if cmp < 0
      return rank(key, node.left)
    elsif cmp > 0
      return 1 + size(node.left) + rank(key, node.right)
    else
      return size(node.left)
    end

  end

end
