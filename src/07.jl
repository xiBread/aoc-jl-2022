const input = readlines("inputs/07.txt")

function day07()
    paths = [""]
    sizes = Dict{String,Int64}()
    freespace = -40_000_000

    for line ∈ input
        if startswith(line, "\$ cd ..")
            pop!(paths)
        elseif startswith(line, "\$ cd ")
            push!(paths, "$(last(paths))/$line")
        elseif isdigit(line[1])
            size = parse(Int, split(line, " ")[1])
            freespace += size

            mergewith!(+, sizes, Dict(path => size for path ∈ paths))
        end
    end

    vals = collect(values(sizes))

    sum(filter(i -> i ≤ 100_000, vals)),
    minimum(filter(i -> i ≥ freespace, vals))
end

println(@time "Day 07" day07())
