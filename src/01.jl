calories = sort(map(
    group -> sum(map(n -> parse(Int, n), split(group, '\n'))),
    split(read("inputs/01.txt", String), "\n\n")
))

output() = (calories[end], sum(calories[end-2:end]))

@time output()
@show output()
