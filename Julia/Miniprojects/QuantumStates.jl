module QuantumStates
using SymPy
import Base.:+, Base.:*, Base.:-, Base.:^, Base.==

export qState, qGate
export σx, σy, σz, I, H, sOne, sZero, sPlus, sMinus, sIPlus, sIMinus
export polar, zmatrix, BlochCoordinates, print

unit = Sym(1)

struct qState
    vector::Vector
    c::Union{Sym, Float64}
    name::String
    function qState(vector::Vector{<:Number}, name::String="_")
        if size(vector)[1]==2
            arg = abs(vector[1]^2) + abs(vector[2]^2)
            c = 1/sqrt(arg*unit)
            return new(unit*vector, c, name)
        else
            error("Invalid vector")
        end
    end
    function qState(values::Tuple{Number, Number}, name::String="_")
       if (0 <= values[1] <= π) && (0 <= values[2] < 2π)
           θ, φ = Sym("θ φ")
           ans = [cos(θ/2) , ℯ^(φ*im)*sin(θ/2)]
           ans = ans.subs(θ, values[1])
           ans = ans.subs(φ, values[2]==π ? PI : values[2])
           return qState(vec(ans), name)
       else
           error("Angles out of range")
       end
    end
end


struct qGate
    matrix::Array{<:Number, 2}
end

# Basic operations between States and Gates
+(m::qState,n::qState)  = qState(m.vector + n.vector)
-(m::qState,n::qState)  = qState(m.vector - n.vector)
+(m::qGate, n::qGate)   = qGate(m.matrix + n.matrix)
*(m::Number, n::qState) = qState(m*n.vector)
*(m::qState,n::qState)  = (m.c*n.c)*(transpose(m.vector)*n.vector)
*(G::qGate, S::qState)  = qState(G.matrix*S.vector)
*(m::qGate, n::qGate)   = qGate(m.matrix*n.matrix)
*(n::Number,G::qGate)   = qGate(n*G.matrix)
^(G::qGate, n::Int64)   = qGate(G.matrix^n)
==(m::qState, n::qState)= m.vector == n.vector
Base.show(io::IO, m::qState)= print(io, "|$(m.name)⟩ = $(m.vector)")
Base.show(io::IO, m::qGate) = show(stdout, "text/plain", m.matrix)

begin const
     σx = qGate([0 1; 1 0])
     σy = qGate([0 -im; im 0])
     σz = qGate([1 0; 0 -1])
     H = qGate(1/sqrt(2*unit) * [1 1; 1 -1])
     I = qGate([1 0; 0 1])
     sOne = qState([0, 1], "1")
     sZero = qState([1, 0], "0")
     sPlus = qState(1/sqrt(2*unit)*(sZero+sOne).vector, "+")
     sMinus = qState(1/sqrt(2*unit)*(sZero-sOne).vector, "-")
     sIPlus = qState(1/sqrt(2*unit)*(sZero+im*sOne).vector, "+𝑖")
     sIMinus = qState(1/sqrt(2*unit)*(sZero-im*sOne).vector, "-𝑖")
end

# Functions to conversion
function polar(p::Tuple{Number, Number})
    r, φ = p
    arg = φ==π ? -1 : cis(φ)
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

function BlochCoordinates(m::qState)
    x = m.vector[2].as_real_imag()[1]
    y = m.vector[2].as_real_imag()[2]
    z = m.vector[1]
    return m.c*[x, y, z]
end

end
