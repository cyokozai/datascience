using Dates

include("ch1.jl")

function main()
    DATE := now(::Type{UTC})
    FILE := "result-$DATE"

    open("./result", "w") do FILE
        println("Date: " + DATE)
        println("====================")
        prob1()
    end
end

main()
