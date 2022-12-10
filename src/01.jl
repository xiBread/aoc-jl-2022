const input = readlines("inputs/01.txt")

function day01()
    groups = [[0]]

    for line in input
        line == "" ? push!(groups, [0]) : push!(groups[end], parse(Int, line))
    end

    calories = sort([sum(group) for group in groups])
    calories[end], sum(calories[end-2:end])
end

println(@time "Day 01" day01())
