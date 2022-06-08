#!/home/dany98/.julia/julia-1.6.0/bin/julia
module FunMath
using LinearAlgebra, Decimals, SymEngine
export sumInnerLattice, getSphereByPoints
export contFraction, sumDigits!, collatz

function sumInnerLattice(n::Int64; 
                        unitCircle::Bool=true,
                        symbolic::Bool=false)
    ans = 0
    θ = (symbolic ? PI : π) / n
    r = unitCircle ? 1 : csc(θ)/2
    ans = sum([2r*sin(θ*i) for i in 1:n÷2])
    ans -= (n*r/2)*(iseven(n) ? 1 : 0)
    return n*ans
end
  
function getSphereByPoints(points::Matrix; numeric::Bool=false)
    m = size(points)[1]
    n = size(points)[2]
    if m == n+1
        R = Vector{Rational}()
        for i in 1:m
            aux = sum([j^2 for j in points[i,:]])
            append!(R, aux)
        end
        M = Matrix{numeric ? Float32 : Rational}(hcat(points, ones(m)))
        V = vec(inv(M)*R)
        C = pop!(V)
        V = [i/2 for i in V]
        r = sqrt(sum([i^2 for i in V]) + C)
        return (V, r)
    else
        print("Invalid matrix of points")
    end
end

function contFraction(a, b; aprox=false)
    s = prod(map(sign, [a, b]))
    a = abs(a)
    b = abs(b)
    result = Vector{Int64}()
    while (b > 0)
        q = 0
        while (!(a<b*(q+1))) q+=1 end
        append!(result, q*s)
        aux = a; a = b
        b = aux-q*b
    end
    return (!aprox ? result : aproxCalc(result))
end

function aproxCalc(list)
    result = Vector{Float32}()
    for i in 1:size(list)[1]
        aux = calcFraction!(list[1:i])
        append!(result, aux)
    end
    return result
end

function calcFraction!(list)
    ans = 0
    int = popfirst!(list)
    while (!isempty(list))
        ans = 1/(pop!(list)+ans)
    end
    return int+ans
end

function listDigits(num)
    if isinteger(num)
        n = Integer(num)
    else
        n = Decimal(num).c
    end
    ans = Vector{Int64}()
    while n != 0
        append!(ans, n%10)
        n = Integer(n÷10)
    end
    return ans
end

function sumDigits!(num)
    while true
        Dlist = listDigits(num)
        num = sum(Dlist)
        if (num < 10) && isinteger(num)
            return num
        end
    end
end

function collatz(n::Int64)
    ans = [abs(n)]
    while n != 1
        n = UInt64(abs(Integer(n)))
        if iseven(n)
            n = n/2
        else
            n = 3n + 1
        end
        push!(ans, n)
    end
    return ans
end


end # module
