input = read("inputs/01.txt", String)

function day01()
    calories = sort(
        map(
            group -> sum(map(n -> parse(Int, n), split(group, '\n'))),
            split(input, "\n\n")
        )
    )

    (calories[end], sum(calories[end-2:end]))
end

@time day01()
@show day01()
