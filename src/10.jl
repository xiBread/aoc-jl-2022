const input = readlines("inputs/10.txt")

function day10()
    register = i = j = 1
    strength = 0

    crt = zeros(Bool, 40, 6)

    for line ∈ input
        value = filter(!isletter, line)
        value = value == "" ? 0 : parse(Int, value)

        for _ ∈ 1:(value == 0 ? 1 : 2)
            i == 41 && (i = 1; j += 1)
            i == 20 && (strength += register * (40j - 20))

            crt[i, j] = i ∈ register:register+2
            i += 1
        end

        register += value
    end

    strength, join(map(join, eachrow(ifelse.(crt', "#", "."))), '\n')
end

println.(@time "Day 10" day10())
