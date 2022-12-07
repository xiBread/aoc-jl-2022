priority(chr) = islowercase(chr) ? chr - 'a' + 1 : chr - 'A' + 27

function day03()
    input = readlines("inputs/03.txt")

    sum(priority(first(line[1:end÷2] ∩ line[end÷2+1:end])) for line ∈ input),
    sum(priority(first(∩(input[i:i+2]...))) for i ∈ 1:3:length(input))
end

println(@time "Day 03" day03())
