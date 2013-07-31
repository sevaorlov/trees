class Node

  attr_accessor :leftNode, :rightNode, :rightCount, :leftCount

  def initialize(value)
    @value = value
    @rightCount = 0
    @leftCount = 0
    @same = 0
  end

  # rotates tree and returns new root if needed
  def balanceTree

    if @leftCount > @rightCount*2
      return rotateLeft
    elsif @rightCount > @leftCount*2
      return rotateRight
    end

    return self
  end

  def rotateLeft
    node = @leftNode
    @leftNode = @leftNode.rightNode
    @leftCount = node.rightCount

    node.rightNode = self
    node.rightCount = length
    node
  end

  def rotateRight
    node = @rightNode
    @rightNode = @rightNode.leftNode
    @rightCount = node.leftCount

    node.leftNode = self
    node.leftCount = length
    node
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

    @rightNode = @rightNode.balanceTree if @rightNode
    @leftNode = @leftNode.balanceTree if @leftNode
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
    node = Node.new(value)
    @rootNode.link node
  end

  def length
    @rootNode.length
  end

end
