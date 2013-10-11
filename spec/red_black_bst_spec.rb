load 'red_black_bst.rb'

describe RedBlackBST do

  let!(:tree) { RedBlackBST.new(IntComparator) }

  it 'should calculate length' do
    tree.put 10
    tree.put 11
    tree.put 12
    tree.put 12
    tree.put 7
    tree.treeSize.should == 5
  end

  it 'should return right greater count' do

    tree.put(10).should == 0
    tree.put(11).should == 0
    tree.put(12).should == 0
    tree.put(9).should == 3
    tree.put(7).should == 4
    tree.put(13).should == 0
    tree.put(0).should == 6
    tree.put(8).should == 5
  end

  it 'should return right greater count 2' do
    tree.put(2).should == 0
    tree.put(1).should == 1
    tree.put(3).should == 0
    tree.put(1).should == 2
    tree.put(2).should == 1
  end

  it 'should return right rank' do
    tree.put 10
    tree.put 11
    tree.put 12
    tree.treeRank(9).should == 0
    tree.treeRank(14).should == 3

    tree.put 12
    tree.treeRank(20).should == 4
  end

end
