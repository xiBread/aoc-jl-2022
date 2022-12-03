calories = sort(map(
    group -> sum(map(n -> parse(Int, n), split(group, '\n'))),
    split(read("inputs/01.txt", String), "\n\n")
))

println((calories[end], sum(calories[end-2:end])))
