import Base: tryparse, parse

function tryparse(::Type{Complex{T}}, s::String) where {T<:Real}
    # skip initial whitespace
    i = start(s)
    e = endof(s)
    while i ≤ e && isspace(s[i])
        i = nextind(s, i)
    end
    i > e && return Nullable{Complex{T}}()

    # find index of ± separating real/imaginary parts (if any)
    i₊ = search(s, ('+','-'), i)
    if i₊ == i # leading ± sign
        i₊ = search(s, ('+','-'), i₊+1)
    end
    if i₊ != 0 && s[i₊-1] in ('e','E','f') # exponent sign
        i₊ = search(s, ('+','-'), i₊+1)
    end
    if i₊ == 0 # purely real value
        return Nullable{Complex{T}}(tryparse(T, s))
    end

    # find trailing im/i/j
    iᵢ = rsearch(s, ('m','i','j'), e)
    iᵢ < i₊ && return Nullable{Complex{T}}()
    if s[iᵢ] == 'm' # im
        iᵢ -= 1
        s[iᵢ] == 'i' || return Nullable{Complex{T}}()
    end
    isdigit(s[iᵢ-1]) || return Nullable{Complex{T}}()

    # parse real part
    re = tryparse(T, SubString(s, i, i₊-1))
    isnull(re) && return Nullable{Complex{T}}()

    # parse imaginary part
    im = tryparse(T, SubString(s, i₊+1, iᵢ-1))
    isnull(im) && return Nullable{Complex{T}}()

    return Nullable{Complex{T}}(Complex{T}(get(re), s[i₊]=='-' ? -get(im) : get(im)))
end
