const input = readlines("inputs/05.txt")

function day05()
    idx = findfirst('1' .∈ input) - 1

    crates = input[1:idx]
    procedure = input[idx+3:end]

    stacks = [Char[] for _ ∈ 1:9]

    for i ∈ 1:9
        for j ∈ idx:-1:1
            crate = crates[j][4i-2]
            crate == ' ' && break

            push!(stacks[i], crate)
        end
    end

    stacks′ = deepcopy(stacks)

    for line ∈ procedure
        quantity, from, to = parse.(Int, split(line)[2:2:6])

        append!(stacks[to], reverse(stacks[from][end-quantity+1:end]))
        append!(stacks′[to], stacks′[from][end-quantity+1:end])

        stacks[from] = stacks[from][1:end-quantity]
        stacks′[from] = stacks′[from][1:end-quantity]
    end

    join(last.(stacks)), join(last.(stacks′))
end

println(@time "Day 05" day05())
