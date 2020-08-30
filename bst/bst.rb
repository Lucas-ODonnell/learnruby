class TreeNode
    attr_accessor :value, :left, :right 
    def initialize(value, left = nil, right = nil)
        @value = value
        @left = left
        @right = right
    end
end

class Tree
   attr_accessor :array, :node, :root 

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

        if node.value > value && !node.left.nil? 
            insert(node.left, value)
        elsif node.value < value && !node.right.nil?
            insert(node.right, value)
        elsif node.value > value && node.left.nil? 
            node.left = TreeNode.new(value)
        elsif node.value < value && node.right.nil?
            node.right = TreeNode.new(value)
        end
    end

    def delete(node, value) #need to fix
        if node.nil?
            return node 
        elsif node.value > value 
            delete(node.left, value)
        elsif node.value < value 
            delete(node.right, value)
        else
            ######we are at the node to be deleted###
            if node.left.nil? && node.right.nil?
                temp = node 
                parent = find_parent_of(self.node, temp.value)
                parent.left.value == value ? parent.left = nil : parent.right = nil
                #temp.value = nil
            elsif node.left.nil?
                temp = node
                parent = find_parent_of(self.node, temp.value)
                parent.value > node.right.value ? parent.left = node.right : parent.right = node.right
                #temp.value = nil   
            elsif node.right.nil?
                temp = node
                parent = find_parent_of(self.node, temp.value)
                parent.value > node.left.value ? parent.left = node.left : parent.right = node.left

                #temp.value = nil   
            else
                parent = find_parent_of(self.node, node.value)
                if parent.left == node 
                    temp = find_max(node.left)
                    left_child = node.left 
                    node.value = temp.value 
                    node.left = left_child
                    node.left = delete(node.left, temp.value)
                    parent.left = node 
                else
                    temp = find_max(node.left)
                    left_child = node.left 
                    node.value = temp.value
                    node.left = left_child
                    node.left = delete(node.left, temp.value)
                    parent.right = node
                end 
            end
        end
        delete_children(node)
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

    def level_order_traversel(node)
        return if node.nil?
        level_order = []
        queue = [node]
       
        until queue.length < 1
            current = queue.first 
            level_order << current.value
            queue.push(current.left) unless current.left.nil?
            queue.push(current.right) unless current.right.nil?
            queue.shift
        end
        level_order
    end
    
    def depth(node, value, count=0)
        return if node.nil?
        
        if node.value > value 
            depth(node.left, value, count+=1) 
        elsif node.value < value 
            depth(node.right, value, count+=1) 
        else
            count
        end
    end

    def height(node, value, count=0)
        return if node.nil?
        if node.value > value 
            height(node.left, value)
        elsif node.value < value 
            height(node.right, value)
        else
            if node.left.nil? && node.right.nil?
                count
            elsif !node.left.nil? && !node.right.nil? 
                height(node.left, node.left.value, count+=1) || height(node.right, node.right.value, count+=1)
            elsif node.left.nil?
                height(node.right, node.right.value, count+=1)
            elsif node.right.nil?
                height(node.left, node.left.value, count+=1)
            end
        end
    end

    def balanced?(node)
        array = level_order_traversel(node)
        array.each do |value|
        left = left_height(node, value)
        right = right_height(node, value)

        return false if (left - right).abs > 1
        end
        true
    end

    def rebalance(node)
        if balanced?(node)
            puts "the tree is already balanced"
        else
            array = level_order_traversel(node)
            self.node = build_tree(array)
        end

    end
    #####helper methods for balanced
    def left_height(node, value, count=0)
        return if node.nil?
        if node.value > value 
            left_height(node.left, value)
        elsif node.value < value 
            left_height(node.right, value)
        else
            if node.left.nil? && node.right.nil?
                count
            elsif !node.left.nil?
                left_height(node.left, node.left.value, count+=1)
            else
                0
            end
        end
    end

    def right_height(node, value, count=0)
        return if node.nil?
        if node.value > value 
            right_height(node.left, value)
        elsif node.value < value 
            right_height(node.right, value)
        else
            if node.left.nil? && node.right.nil?
                count
            elsif !node.right.nil?
                right_height(node.right, node.right.value, count+=1)
            else
                0
            end
        end
    end
    #####################3
    def pretty_print(tree_node = node, prefix="", is_left = true) #thanks 
        pretty_print(tree_node.right, "#{prefix}#{is_left ? "│ " : " "}", false) if tree_node.right
        puts "#{prefix}#{is_left ? "└── " : "┌── "}#{tree_node.value.to_s}"
        pretty_print(tree_node.left, "#{prefix}#{is_left ? " " : "│ "}", true) if tree_node.left
    end
end