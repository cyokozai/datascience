using Dates

include("ch1.jl")

function main()
    DATE = now(UTC)
    FILE = "result-$DATE"
    f = open("./result/$FILE", "w")
    println(f, "Date: $DATE")
    close(f)
    
    prob1(DATE, FILE)
end

main()
