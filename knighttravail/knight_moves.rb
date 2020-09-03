module KnightMoves
     def edge1(pos) #SE
        row, col = pos 
        if pos[0] + 2 <= 7 && pos[1] + 1 <= 7
           [row + 2, col + 1] 
        end
    end

    def edge2(pos)#SW
        row, col = pos 
        if pos[0] + 2 <= 7 && pos[1] - 1 >= 0
           [row + 2, col - 1] 
        end
    end

    def edge3(pos)#NE
        row, col = pos 
        if pos[0] - 2 >= 0 && pos[1] + 1 <= 7
           [row - 2, col + 1] 
        end
    end

    def edge4(pos)#NW
        row, col = pos 
        if pos[0] - 2 >= 0 && pos[1] - 1 >= 0
           [row - 2, col - 1] 
        end
    end

    def edge5(pos)#ES
         row, col = pos 
        if pos[0] + 1 <= 7 && pos[1] + 2 <= 7
           [row + 1, col + 2] 
        end
    end

    def edge6(pos)#EN
         row, col = pos 
        if pos[0] - 1 >= 0 && pos[1] + 2 <= 7
           [row - 1, col + 2] 
        end
    end

    def edge7(pos)#WS
         row, col = pos 
        if pos[0] + 1 <= 7 && pos[1] - 2 >= 0
           [row + 1, col - 2] 
        end
    end

    def edge8(pos)#WN
         row, col = pos 
        if pos[0] - 1 >= 0 && pos[1] - 2 >= 0
           [row - 1, col - 2] 
        end
    end
end