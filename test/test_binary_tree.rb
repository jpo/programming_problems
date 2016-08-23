require 'helper'

module ProgrammingProblems
  class BinaryTreeTest < MiniTest::Test
    describe 'BinaryTree' do
      it 'initializes empty' do
        tree = BinaryTree.new
        assert tree.root.nil?
      end

      it 'inserts a node' do
        tree = BinaryTree.new
        tree.insert(1)
        assert_equal 1, tree.root.data
        assert tree.root.left.nil?
        assert tree.root.right.nil?
      end

      it 'sorts nodes on insert' do
        tree = BinaryTree.new
        [3, 1, 2, 4, 5].each { |n| tree.insert(n) }
        assert_equal 3, tree.root.data
        assert_equal 1, tree.root.left.data
        assert_equal 2, tree.root.left.right.data
        assert_equal 4, tree.root.right.data
        assert_equal 5, tree.root.right.right.data
      end

      it 'finds a node by value' do
        tree = BinaryTree.new
        (1..5).each { |n| tree.insert(n) }
        assert_equal 3, tree.find_value(3).data
        assert tree.find_value(0).nil?
      end

      it 'finds the parent of a given node' do
        tree = BinaryTree.new
        (1..5).each { |n| tree.insert(n) }
        child = tree.root.right
        assert_equal 2, child.data
        assert_equal 1, tree.find_parent(child).data
      end

      it 'finds the successor of a given node' do
        tree = BinaryTree.new
        (1..5).each { |n| tree.insert(n) }
        parent = tree.root
        assert_equal 1, parent.data
        assert_equal 2, tree.find_successor(parent).data
      end
    end
  end
end
