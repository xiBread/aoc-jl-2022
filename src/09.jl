const input = readlines("inputs/09.txt")

const directions = Dict(
    'R' => [1, 0],
    'L' => [-1, 0],
    'U' => [0, 1],
    'D' => [0, -1],
)

movetail(tail, head) = (
    Δ = head - tail;
    maximum(abs.(Δ)) ≤ 1 ? tail : tail + clamp.(Δ, -1, 1)
)

function tailpositions(n, tail)
    positions = Vector{Vector{Int}}(undef, size(tail))

    for _ ∈ 1:n
        accumulate!(movetail, positions, tail)
        tail = positions
    end

    positions
end

function day09()
    Δ = map(x -> (x[1], parse(Int, x[2:end])), input) |>
        (it -> map(x -> repeat(x[1], x[2]), it)) |>
        Iterators.Flatten |>
        (it -> map(x -> directions[x], it)) |>
        (it -> pushfirst!(it, [0, 0]))

    a = tailpositions(1, cumsum(Δ, dims=1))
    b = tailpositions(8, a)

    length(unique(a)), length(unique(b))
end

println(@time "Day 09" day09())
