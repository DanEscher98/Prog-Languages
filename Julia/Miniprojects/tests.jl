# Get memory address: repr(UInt64(pointer_from_objref(x)))
# Get memory info: varinfo()?
# Number of decimals: precision(type)
# Limits of a type: typemin(), typemax()
# Different parts of an expression: names()
# A tuple of Symbols representing the field names: fieldnames(Point)

using DataFrames
using CSV
using Tables

M = CSV.File("data.csv") |> Tables.matrix
M = convert(Matrix{Float64}, M)
A = M[[1], :]
