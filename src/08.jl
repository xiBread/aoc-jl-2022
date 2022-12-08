directions(map, i, j) = (
    map[1:i-1, j], # up
    map[i+1:end, j], # down
    map[i, j+1:end], # left
    map[i, 1:j-1] # right
)

visibles(direction, height) = something(findfirst(height .≤ direction), size(direction, 1))

function day08()
    map = parse.(Int, reduce(hcat, collect.(readlines("inputs/08.txt"))))
    h, w = size(map)

    visible = 2h + 2w - 4
    scores = []

    for i ∈ 2:h-1
        for j ∈ 2:w-1
            visible += any([
                all(height < map[i, j] for height ∈ dir) for dir ∈ directions(map, i, j)
            ])
        end
    end

    for i ∈ axes(map, 1)
        for j ∈ axes(map, 2)
            u, d, l, r = directions(map, i, j)
            height = map[i, j]

            push!(
                scores,
                visibles(reverse(u), height) *
                visibles(d, height) *
                visibles(l, height) *
                visibles(reverse(r), height)
            )
        end
    end

    visible, maximum(scores)
end

println(@time "Day 08" day08())
