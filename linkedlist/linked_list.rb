require_relative "node"
class LinkedList
    attr_accessor :head
    
    def initialize
        @head = nil
    end
    
    def prepend(value)
        unless self.head.nil?
        node = Node.new(value)
        node.next_node = self.head
        self.head = node
        else
        self.head = Node.new(value)
        end
    end

    def append(value)
        if head.nil?
            head = Node.new(value)
        else
            tail.next_node = Node.new(value)
        end
    end

     def first_node #head is already taken
       at(1).value
    end
    
    def tail
        pointer = head 
        until pointer.next_node.nil?
            pointer = pointer.next_node 
        end 
        pointer
    end
    
    def size
        pointer = head 
        count = 1
        until pointer == tail
            count += 1
            pointer = pointer.next_node
        end 
        count
    end

    def find_value(value)
        pointer = head 
        count = 1
        until pointer.value == value 
            pointer = pointer.next_node 
            count += 1
        end
       count
    end
    
    def at(idx)
        pointer = head
        (idx - 1).times do
            raise "this is invalid" if pointer.next_node.nil?
            pointer = pointer.next_node 
        end
        pointer
    end

    def insert_at(value, idx)
        pointer = head
        (idx - 2).times do
            raise "error" if pointer.nil?
            pointer = pointer.next_node
        end
        new_node = Node.new(value)
        new_node.next_node = pointer.next_node 
        pointer.next_node = new_node
    end

    def delete_at(idx)
        one_before = head
        one_after = head 
        (idx - 2).times do 
            raise "error" if one_before.nil?
            one_before = one_before.next_node
        end
        (idx).times do
            one_after = one_after.next_node
        end
        one_before.next_node = one_after
    end        

    def pop
       if size == 1
        head = nil 
       else
        new_tail = at(size - 1)
        new_tail.next_node = nil 
        new_tail = tail
       end
    end

    def contains?(value)
        pointer = head 
        until pointer.next_node.nil?  
            return true if pointer.value == value || tail.value == value
            pointer = pointer.next_node
        end
        false
    end 
    
    def to_s
        pointer = head
        string = ""
        until pointer == tail
            string += "(#{pointer.value}) => "
            pointer = pointer.next_node
        end
        string += "(#{tail.value}) => nil"
        string 
    end
end