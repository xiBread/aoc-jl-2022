function day05()
    input = readlines("inputs/05.txt")
    idx = findfirst('1' .∈ input) - 1

    crates = input[1:idx]
    procedure = input[idx+3:end]

    stacks = [Char[] for _ in 1:9]

    for i ∈ 1:9
        for j ∈ idx:-1:1
            crate = crates[j][4i-2]
            crate == ' ' && break

            push!(stacks[i], crate)
        end
    end

    stacks′ = deepcopy(stacks)

    for line ∈ procedure
        (quantity, from, to) = parse.(Int, split(line)[2:2:6])

        append!(stacks[to], reverse(stacks[from][end-quantity+1:end]))
        append!(stacks′[to], stacks′[from][end-quantity+1:end])

        stacks[from] = stacks[from][1:end-quantity]
        stacks′[from] = stacks′[from][1:end-quantity]
    end

    (prod(last.(stacks)), prod(last.(stacks′)))
end

@time day05()
@show day05()
