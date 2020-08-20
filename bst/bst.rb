require_relative "tree_node"
class Tree
    attr_accessor :array, :node

    def initialize(array)
        @node = build_tree(array)
    end

    def build_tree(array)
        return nil if array.length == 0
        return TreeNode.new(array.first) if array.length == 1
        
        mid = array.length/2
        sorted_array = array.sort.uniq
        
        tree = TreeNode.new(sorted_array[mid])
        tree.left = build_tree(sorted_array[0...mid])
        tree.right = build_tree(sorted_array[mid + 1..-1])
        tree 
    end

    def contains?(node, value)
        return false if node.nil?
        return true if node.value == value 

        left_side = contains?(node.left, value)
        if left_side
            return true
        end 
        right_side = contains?(node.right, value)
        if right_side
            return true 
        end
        false
    end

    def insert(node, value)
        return if contains?(node, value)
        if node.nil?
            node = TreeNode.new(value)
        end
        
        if node.value < value 
            node.right.nil? ? node.right = TreeNode.new(value) : insert(node.right, value)
        else
            node.left.nil? ? node.left = TreeNode.new(value) : insert(node.left, value)
        end
    end

    def delete(node, value)
        raise "error" if node.nil?
        
        to_delete = find(node, value)
        parent = find_parent_of(node, value)
        if to_delete.left.nil? && to_delete.right.nil? 
            parent.left == to_delete ? parent.left = nil : parent.right = nil 
            to_delete.value = nil
        elsif to_delete.left.nil? || to_delete.right.nil? && !(to_delete.left.nil? && to_delete.right.nil?)
            parent.left == to_delete
        end
    end

    def find(node, value)
        puts "That is not a valid node" unless contains?(node, value)
        return node if node.value == value
        
        if node.value > value 
            find(node.left, value)
        elsif node.value < value 
            find(node.right, value)
        end
    end

    def find_parent_of(node, value) #put the child to find the parent
        child = find(node, value)
        return node if node.left == child 
        return node if node.right == child

        if node.value > value 
            find_parent_of(node.left, value)
        elsif node.value < value 
            find_parent_of(node.right, value)
        end
    end

    def pretty_print(tree_node = node, prefix="", is_left = true) #thanks 
        pretty_print(tree_node.right, "#{prefix}#{is_left ? "│ " : " "}", false) if tree_node.right
        puts "#{prefix}#{is_left ? "└── " : "┌── "}#{tree_node.value.to_s}"
        pretty_print(tree_node.left, "#{prefix}#{is_left ? " " : "│ "}", true) if tree_node.left
    end

end