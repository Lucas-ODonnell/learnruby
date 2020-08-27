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

    def insert(node, value) #this is causing errors need to fix
        return if contains?(node, value)
        return if node.nil?

        if node.value > value && !node.left.nil? && !node.right.nil?
            insert(node.left, value)
        elsif node.value < value && !node.left.nil? && !node.right.nil?
            insert(node.right, value)
        else

            if node.value > value 
                node.left = TreeNode.new(value)
            else
                node.right = TreeNode.new(value)
            end
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
            elsif node.left.nil?
                temp = node
                parent = find_parent_of(self.node, temp.value)
                parent.value > node.right.value ? parent.left = node.right : parent.right = node.right
                temp.value = nil   
            elsif node.right.nil?
                temp = node
                parent = find_parent_of(self.node, temp.value)
                parent.value > node.left.value ? parent.left = node.left : parent.right = node.left

                temp.value = nil   
            else
                temp = find_max(node.left)
                left_child = node.left 
                node.value = temp.value 
                node.left = delete(node.left, temp.value)
                node.left = left_child
            end
        end
        delete_children(node)
        node 
    end

    def delete_children(node) #deletes when a parent is pointing to a nil child
        return if node.nil?
        return if node.left.nil? || node.right.nil?
            
        if node.left.value == nil
            node.left = nil
        elsif node.right.value == nil
            node.right = nil
        end 
        delete_children(node.left) || delete_children(node.right)  
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