function findmarker(len::Int64)
    input = read("inputs/06.txt", String)

    for i in len:length(input)
        allunique(input[i-~-len:i]) && return i
    end
end

day06() = (findmarker(4), findmarker(14))

@time day06()
@show day06()
