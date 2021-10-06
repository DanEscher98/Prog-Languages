using JSON
using DataFrames

data = JSON.parsefile("matrixData.json")

function getM(name::String)
    ans = reduce(hcat, data[name])
    return map(y->convert(Int64,y), ans)
end


println("The matrix A")
show(stdout, "text/plain", getM("A"))
println("")

println("The matrix B")
show(stdout, "text/plain", getM("B"))
println("")
