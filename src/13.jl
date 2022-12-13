using JSON
using Match

const input = read("inputs/13.txt", String)

<(l, r) = @match (l, r) begin
    (l::Int, r::Int) => isless(l, r)
    (l::Vector, r::Int) => l < [r]
    (l::Int, r::Vector) => [l] < r
    (l::Vector, r::Vector) =>
        !isempty(r) && (isempty(l) || l[1] < r[1] || (!(r[1] < l[1]) && l[2:end] < r[2:end]))
end

function day13()
    sum = 0

    for (i, pair) ∈ enumerate(eachsplit(input, "\n\n"))
        cmp(<, (JSON.parse.(split(pair, '\n')))...) <= 0 && (sum += i)
    end

    packets = [JSON.parse(line) for line ∈ eachsplit(input, '\n') if !isempty(line)]
    sort!(push!(packets, [[2]], [[6]]), lt = <)

    sum, findfirst(==([[2]]), packets) * findfirst(==([[6]]), packets)
end

println(@time "Day 13" day13())
