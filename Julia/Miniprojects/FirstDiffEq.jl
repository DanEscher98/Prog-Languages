#!/home/dany98/.julia/julia-1.6.0/bin/julia

using DifferentialEquations
using Gadfly

f(u,p,t) = 1.01*u
u0 = 1/2
tspan = (0.0,1.0)
prob = ODEProblem(f,u0,tspan)
sol = solve(prob, Tsit5(), reltol=1e-8, abstol=1e-8)


plt = plot(Guide.title("Solution to the linear ODE"),
            Guide.xlabel("Time (t)"),
            Guide.ylabel("u(t) (in μm)"),
            Coord.cartesian(fixed=true))
push!(plt, layer(x=sol.t, y=sol.u,
                Geom.path()))
push!(plt, layer(t->0.5*exp(1.01t), 0, 1,
                Geom.point))
draw(SVG("ODEsolution.svg"), plt)
