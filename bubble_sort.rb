def bubble_sort(arr)
    sorted = false

    while !sorted
        sorted = true 
        (0...arr.length - 1).each do |idx|
            if arr[idx] > arr[idx + 1]
                arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx]
                sorted = false
            end
        end
    end
    arr
end

