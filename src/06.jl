const input = read("inputs/06.txt")

findmarker(len) = ~-findfirst(
    x -> !any(m -> any(n -> x[m] == x[n], m+1:length(x)), 1:length(x)),
    ((view(input, i:i+len-1)) for i in 1:length(input)-len+1)
) + len

day06() = findmarker(4), findmarker(14)

println(@time "Day 06" day06())
