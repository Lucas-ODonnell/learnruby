require_relative "board"
class Knight
    attr_reader :board
    def initialize
        @board = Board.new
        @possible_moves = [[-2, -1], [-2, 1], [-1, -2],
         [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]]
    end

    def knight_moves(start, destination)
        visited = {}
        queue = [[destination, nil]]

        while queue.any?
            current_node, next_node = queue.shift 
            next if visited.has_key?(current_node)
            visited[current_node] = next_node
            
            return find_route(start, destination, visited) if current_node == start
            
            possible_moves(current_node).each do |next_move|
                queue << [next_move, current_node] unless visited.has_key?(next_move)
            end
        end
    end

    def find_route(start, destination, visited)
        route = [start]
        while next_node = visited[route.last]
            route << next_node
        end

        if route.last == destination
            route
        else
            nil
        end
    end

    def possible_moves(node)
        array = []
        @possible_moves.each do |num1, num2|
            array << [node.first + num1, node.last + num2]
        end
        array.select(&method(:valid_move?))
    end

    def valid_move?(node)
    node.all? { |n| n >= 0 && n <= 7 }
    end            
end