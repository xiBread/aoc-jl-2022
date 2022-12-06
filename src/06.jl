function findmarker(len::Int64)
    input = readline("inputs/06.txt")

    for i in len:length(input)
        allunique(input[i-~-len:i]) && return i
    end
end

day06() = (findmarker(4), findmarker(14))

@time day06()
@show day06()
