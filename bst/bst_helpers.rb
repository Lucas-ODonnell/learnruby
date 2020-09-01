module Helpers 
    def contains?(node, value)
        return false if node.nil?
        return true if node.value == value 

        contains?(node.left, value) || contains?(node.right, value)
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

    def find_min(node)
        current = node 
        until current.left.nil?
            current = current.left 
        end
        current
    end

    def find_parent_of(node, value) #put the child to find the parent
        child = find(node, value)
        return false if node.nil?
        return node if node.left == child 
        return node if node.right == child

        find_parent_of(node.left, value) || find_parent_of(node.right, value)
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

end