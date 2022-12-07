function findmarker(len::Int64)
    input = read("inputs/06.txt")

    ~-findfirst(i -> allunique(input[i-~-len:i]), len:length(input)) + len
end

day06() = findmarker(4), findmarker(14)

println(@time "Day 06" day06())
