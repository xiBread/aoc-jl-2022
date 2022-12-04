input = readlines("inputs/04.txt")

function day04()
    x = y = 0

    for line ∈ input
        a, b, c, d = map(n -> parse(Int, n), split(replace(line, "-" => ","), ","))
        ab, cd = Set(a:b), Set(c:d)

        x += ab ⊆ cd || cd ⊆ ab
        y += length(ab ∩ cd) > 0
    end

    x, y
end

@time day04()
@show day04()
