class Node

  attr_accessor :leftNode, :rightNode

  LIMIT_COUNT = 2

  def initialize(value)
    @value = value
    @rightCount = 0
    @leftCount = 0
    @same = 0
  end

  # returns new root
  def balanceTree

    if @leftCount >= @rightCount + LIMIT_COUNT
      node = @leftNode
      @leftNode = @leftNode.rightNode
      calculateCounts

      node.rightNode = self
      node.calculateCounts
      return node
    elsif @rightCount >= @leftCount + LIMIT_COUNT
      node = @rightNode
      @rightNode = @rightNode.leftNode
      calculateCounts

      node.leftNode = self
      node.calculateCounts
      return node
    end

    return self
  end

  def calculateCounts
    @leftCount = @leftNode ? @leftNode.length : 0
    @rightCount = @rightNode ? @rightNode.length : 0
  end

  def value
    @value
  end

  def length
    @rightCount + @leftCount + 1 + @same
  end

  def link(node)

    res = 0

    if node.value < @value
      res = linkToNode('leftNode', node)
      res += @rightCount + 1 + @same
      @leftCount += 1
    elsif node.value > @value
      res = linkToNode('rightNode', node)
      @rightCount += 1
    elsif node.value == @value
      @same += 1
      res = @rightCount
    end

    return res
  end

  private
  def linkToNode(linkNodeName, node)
    res = 0
    linkNode = instance_variable_get("@#{linkNodeName}")

    if linkNode
      res = linkNode.link(node)
    else
      instance_variable_set("@#{linkNodeName}", node)
    end

    return res
  end

end

class Tree

  def initialize(value)
    node = Node.new(value)
    @rootNode = node
  end

  def add(value)
    @rootNode = @rootNode.balanceTree
    node = Node.new(value)
    @rootNode.link node
  end

  def length
    @rootNode.length
  end

end
