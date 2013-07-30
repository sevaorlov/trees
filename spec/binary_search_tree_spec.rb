load 'tree.rb'

describe 'tree' do

  before(:all) do

    class Tree
      def rootNode
        @rootNode
      end
    end

    class Node
      def rightCount
        @rightCount
      end

      def leftCount
        @leftCount
      end
    end

  end

  it 'should calculate length' do
    tree = Tree.new(10)
    tree.add 11
    tree.add 12
    tree.add 12
    tree.length.should == 4
  end

  it 'should return right greater count' do
    tree = Tree.new(10)

    tree.add(11).should == 0
    tree.add(12).should == 0
    tree.add(9).should == 3
    tree.add(7).should == 4
    tree.add(13).should == 0
    tree.add(0).should == 6
    tree.add(8).should == 5
  end

  it 'should return right greater count 2' do
    tree = Tree.new 2
    tree.add(1).should == 1
    tree.add(3).should == 0
    tree.add(1).should == 2
    tree.add(2).should == 1
  end

  it 'should change root node' do
    tree = Tree.new(10)

    tree.add(11).should == 0
    tree.rootNode.value.should == 10

    tree.add(12).should == 0
    tree.rootNode.value.should == 10

    tree.add(13).should == 0
    tree.rootNode.value.should == 11

    tree.add(14).should == 0
    tree.rootNode.value.should == 11

    tree.add(9).should == 5
    tree.rootNode.value.should == 12

    tree.add(15).should == 0
    tree.rootNode.value.should == 12

    tree.add(16).should == 0
    tree.rootNode.value.should == 12

    tree.add(17).should == 0
    tree.rootNode.value.should == 12

    tree.add(18).should == 0
    tree.rootNode.value.should == 13

    tree.add(19).should == 0
    tree.rootNode.value.should == 13

    tree.add(1).should == 11
    tree.rootNode.value.should == 14
  end

  it 'should work with nodes in descending order' do
    first = 100
    tree = Tree.new(first)

    for i in 1..first
      tree.add(first-i).should == i
    end


  end

end
