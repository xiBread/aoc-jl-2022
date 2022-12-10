const input = readlines("inputs/04.txt")

function day04()
    x = y = 0

    for line ∈ input
        a, b, c, d = map(n -> parse(Int, n), eachsplit(line, [',', '-']))
        ab, cd = a:b, c:d

        x += ab ⊆ cd || cd ⊆ ab
        y += length(ab ∩ cd) > 0
    end

    x, y
end

println(@time "Day 04" day04())
