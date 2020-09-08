def redundant_directions(array)
    opposites = {
        "North" => "South",
        "South" => "North",
        "West" => "East",
        "East" => "West"
    }
    directions = [] 

    array.each do |dir|
        opposites[dir] == directions.last ? directions.pop : directions << dir 
    end
    puts directions 
end
 