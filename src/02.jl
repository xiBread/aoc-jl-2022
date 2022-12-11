const input = readlines("inputs/02.txt")

score(a, b) = ((b - a + 4) % 3) * 3 + b + 1

function day02()
    rounds = map(line -> (line[1] - 'A', line[3] - 'X'), input)

    sum(score(a, b) for (a, b) ∈ rounds), sum(score(a, (a + b + 2) % 3) for (a, b) ∈ rounds)
end

println(@time "Day 02" day02())
