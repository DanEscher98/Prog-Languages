__precompile__()

module ComplexFunk
using SymPy
using Decimals
using Gadfly
using Fontconfig, Cairo

export nthroots, drawImRoute, polar, zmatrix
export isInteger, toInteger, SymRational, Fib

function Base.show(io::IO, m::Vector{SymPy.Sym})
    println(typeof(m))
    for i in m
        show(stdout, "text/plain", i)
        println("\n")
    end
end

function nthroots(z::Number, n::Integer; symbolic::Bool=false)
    roots   = symbolic ? Vector{Sym}() : Vector{Complex{Float32}}()
    z       = symbolic ? SymRational(z) : z
    Pi      = symbolic ? Sym(π) : π
    unit    = symbolic ? Sym(1) : 1
    # Calculations
    r = abs(z)
    θ = atan(unit*imag(z)/real(z))
    if real(z)<0 θ+=Pi end
    for k in 0:n-1
        arg = ((θ+2*Pi*k)/n)
        a = cos(arg)
#=fcky=#b = arg==Pi ? 0 : sin(arg)
        val = r^(unit/n)*(a+b*im)
        append!(roots, val)
    end
    return roots
end

function drawImRoute(values::Vector{<:Complex},
                    p::Integer=25;
                    name::String="Complex roots",
                    save::Bool=false)
    plt = plot(Guide.title(name),
                Guide.xlabel("Real axis"),
                Guide.ylabel("Imaginary axis"),
                Coord.cartesian(fixed=true))
    n = size(values)[1]
    for z in values
        aux = [^(z, step) for step in 1:1/p:n]
        pathR = [real(i) for i in aux]
        pathI = [imag(i) for i in aux]
        pointX = [pathR[i] for i in 1:p:p*n-1]
        pointY = [pathI[i] for i in 1:p:p*n-1]
        push!(plt, layer(x=pathR, y=pathI,
                Theme(default_color=color("purple")),
                Geom.path()))
        push!(plt, layer(x=pointX, y=pointY,
                Geom.point))
    end
    if save
        draw(SVG("Output/"*name*".svg"), plt)
    end
    return plt
end

# Functions to conversion
function polar(p::Tuple{Number, Number})
    r, φ = p
    r = Rational(r)
    φ = Sym(φ)
    arg = φ==π ? -1 : cos(φ)+sin(φ)im
    return r*arg
end

function polar(z::Complex)
    r = abs(z)
    φ = atan(imag(z), real(z))
    return (r, φ)
end

function zmatrix(z::Complex)
    a = real(z)
    b = imag(z)
    return Matrix([a -b ; b a])
end

function zmatrix(z::Array{<:Number, 2})
    return Complex(Real(z[1]), Real(z[2]))
end

function Fib(x::Number)
    x = SymRational(x)
    φ = sympy.S.GoldenRatio
    a = sign(x)==-1 ? 1/φ^abs(x) : φ^x
    ans = (a-cos(PI*x)*1/a)/sqrt(Sym(5))
    if isInteger(ans)
        return Sym(toInteger(ans))
    else
        return ans
    end
end

function SymRational(x::Number)
    if isInteger(x)
        return Sym(toInteger(x))
    elseif isa(x, Irrational)
        return Sym(x)
    elseif isa(x, Float64)
        num = Decimal(Float16(x))
        s = Sym(-1)^num.s
        s*num.c/(10^abs(num.q))
    elseif isa(x, Complex)
        a = real(x)
        b = imag(x)
        a = isinteger(a) ? Int(a) : SymRational(a)
        b = isinteger(b) ? Int(b) : SymRational(b)
        return a+b*im
    else
        return x
    end
end

function toInteger(z::Number)
    z = isa(z, Sym) ? z.evalf() : z
    a = Int(trunc(real(z)))
    b = Int(trunc(imag(z)))
    b==0 ? a : Complex(a, b)
end

function isInteger(z::Number)
    z = isa(z, Sym) ? z.evalf() : z
    if isinteger(real(z)) && isinteger(imag(z))
        return true
    else
        return false
    end
end

end
