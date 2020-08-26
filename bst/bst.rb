class TreeNode
    attr_accessor :value, :left, :right 
    def initialize(value, left = nil, right = nil)
        @value = value
        @left = left
        @right = right
    end
end

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

        contains?(node.left, value) || contains?(node.right, value)
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
        if node.nil?
            return node 
        elsif node.value > value 
            delete(node.left, value)
        elsif node.value < value 
            delete(node.right, value)
        else
            ######we are at the node to be deleted###
            if node.left.nil? && node.right.nil? 
                node.value = nil
                node
            elsif node.left.nil?
                temp = node 
                node = node.right
                temp.value = nil  
            elsif node.right.nil?
                temp = node  
                node = node.left
                temp.value = nil
            else
                temp = find_max(node.left)
                left_child = node.left 
                right_child = node.right 
                node.value = temp.value 
                node.left = left_child
                node.right = right_child 
                node.left = delete(node.left, temp.value)
            end
            node
        end
    end

    def find_max(node)
        return node if node.right.nil?

        find_max(node.right)
    end

    def find(node, value)
        return false if node.nil?
        return node if node.value == value 

        find(node.left, value) || find(node.right, value)
    end

    def find_parent_of(node, value) #put the child to find the parent
        child = find(node, value)
        return false if node.nil?
        return node if node.left == child 
        return node if node.right == child

        find_parent_of(node.left, value) || find_parent_of(node.right, value)
    end

    def pretty_print(tree_node = node, prefix="", is_left = true) #thanks 
        pretty_print(tree_node.right, "#{prefix}#{is_left ? "│ " : " "}", false) if tree_node.right
        puts "#{prefix}#{is_left ? "└── " : "┌── "}#{tree_node.value.to_s}"
        pretty_print(tree_node.left, "#{prefix}#{is_left ? " " : "│ "}", true) if tree_node.left
    end
end