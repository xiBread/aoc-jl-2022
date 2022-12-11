const input = readlines("inputs/03.txt")

priority(c) = c - (c ≤ 'Z' ? 'A' - 27 : 'a' - 1)

function intersect(xs, ys)
    for x ∈ xs, y ∈ ys
        x == y && return x
    end
end

day03() = (
    sum(priority(intersect(line[1:end÷2], line[end÷2+1:end])) for line ∈ input),
    sum(priority(∩(i...)[1]) for i ∈ zip(input[1:3:end], input[2:3:end], input[3:3:end])),
)

println(@time "Day 03" day03())
