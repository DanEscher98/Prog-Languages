### A Pluto.jl notebook ###
# v0.14.5

using Markdown
using InteractiveUtils

# ╔═╡ bbebb958-3516-40c3-b530-ac30c998898f
using DifferentialEquations, Gadfly

# ╔═╡ ce2c2e4a-b7fd-4745-8ffc-0b16cc184b85
f(u,p,t) = 1.01*u

# ╔═╡ bc1a6332-6006-4271-a2a6-a7fcad060987
u0 = 1/2

# ╔═╡ 82e71a61-5aea-450b-bcef-51a96e5750f5
tspan = (0.0,1.0)

# ╔═╡ 037e1632-e7a8-4abb-9544-54c3561efe62
prob = ODEProblem(f,u0,tspan)

# ╔═╡ 4f68352b-74f4-45a0-bee0-dc3cacacfa83
sol = solve(prob, Tsit5(), reltol=1e-8, abstol=1e-8)

# ╔═╡ b6d23c7d-4721-4aec-8456-3315de2459a8
plt = plot(Guide.title("Solution to the linear ODE"),
            Guide.xlabel("Time (t)"),
            Guide.ylabel("u(t) (in μm)"),
            Coord.cartesian(fixed=true))

# ╔═╡ 686a109a-9473-429a-8d31-37a6d6610429
push!(plt, layer(x=sol.t, y=sol.u,
                Geom.path()))

# ╔═╡ bfeed508-0751-4126-aaa4-b2cba45e5a15
push!(plt, layer(t->0.5*exp(1.01t), 0, 1,
                Geom.point))

# ╔═╡ 1f343137-66fd-4e76-af82-5e47b1563f29
draw(SVG("ODEsolution.svg"), plt)

# ╔═╡ Cell order:
# ╠═bbebb958-3516-40c3-b530-ac30c998898f
# ╠═ce2c2e4a-b7fd-4745-8ffc-0b16cc184b85
# ╠═bc1a6332-6006-4271-a2a6-a7fcad060987
# ╠═82e71a61-5aea-450b-bcef-51a96e5750f5
# ╠═037e1632-e7a8-4abb-9544-54c3561efe62
# ╠═4f68352b-74f4-45a0-bee0-dc3cacacfa83
# ╟─b6d23c7d-4721-4aec-8456-3315de2459a8
# ╠═686a109a-9473-429a-8d31-37a6d6610429
# ╠═bfeed508-0751-4126-aaa4-b2cba45e5a15
# ╠═1f343137-66fd-4e76-af82-5e47b1563f29
