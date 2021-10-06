function drawImRoute(values, name::String="roots.png")
    p = 100
    n = size(values )[1]
    roots = Vector{Complex{Float32}}(roots)
    path = enumerate([i for i in 1:1/p:n])
    path_R = Array{Float32}(undef, (n-1)*p+1, n)
    path_I  = Array{Float32}(undef, (n-1)*p+1, n)
    point_R = Array{Float32}(undef, n, n)
    point_I = Array{Float32}(undef, n, n)
    for (j, z) in enumerate(roots)
        for (i, step) in path
            a = real(z^step)
            b = imag(z^step)
            path_R[i, j] = a
            path_I[i, j] = b
            if isinteger(step)
                point_R[Integer(step), j] = a
                point_I[Integer(step), j] = b
            end
        end
    end
    gr();
    plot(path_R, path_I, aspect_ratio=:equal, dpi=360, grid=true, ga=0.5)
    scatter!(point_R, point_I)
    savefig("Output/"*name*".png")
end
