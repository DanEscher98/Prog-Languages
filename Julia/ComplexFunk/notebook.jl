### A Pluto.jl notebook ###
# v0.14.5

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ 4e9ff589-c3b6-4c20-830e-271ca778b91f
begin
	using Pkg
	Pkg.activate(".")
	using ComplexFunk
	using PlutoUI
end

# ╔═╡ d01f6f28-25cd-4061-b15a-b7b0a16ed58b
begin
	using Latexify
	using DifferentialEquations
end

# ╔═╡ 26b1e764-1b72-43ec-83c8-80e01586bfa2
@bind a Slider(-5:0.1:5, default=1)

# ╔═╡ a2a9bcff-2429-44f7-9d6a-9019e296fb9a
@bind b Slider(-5:0.1:5, default=1)

# ╔═╡ 04d1c309-ed15-4df0-8926-d2687b8104ef
@bind n Slider(1:8, default=2)

# ╔═╡ a2d3d329-7650-4e5d-82c1-ae72ac2fa33a
nthroots(a+b*im, n) |> drawImRoute

# ╔═╡ 435d4df1-1289-4063-866e-1eed2390d304
nthroots(a+b*im, n, symbolic=true)[1]

# ╔═╡ 593593d5-0c78-4b03-a7e7-21cd5765d5a7
f = @ode_def positiveFeedback begin
    dx = v*y^n/(k^n+y^n) - x
    dy = x/(k_2+x) - y
end v n k k_2

# ╔═╡ 3114c21c-a9e1-4f03-abb1-e2748227e374
md"%$(latexify(f))"

# ╔═╡ 929cfc77-de23-4d8d-a1d7-93b940b94a62
md"""
# HI
  	* \( x = {-b \pm \sqrt{b^2-4ac} \over 2a} \) And so on

	* \\( a = {\frac{!4}{2} }\\)
"""

# ╔═╡ Cell order:
# ╠═4e9ff589-c3b6-4c20-830e-271ca778b91f
# ╠═26b1e764-1b72-43ec-83c8-80e01586bfa2
# ╠═a2a9bcff-2429-44f7-9d6a-9019e296fb9a
# ╠═04d1c309-ed15-4df0-8926-d2687b8104ef
# ╠═a2d3d329-7650-4e5d-82c1-ae72ac2fa33a
# ╠═435d4df1-1289-4063-866e-1eed2390d304
# ╠═d01f6f28-25cd-4061-b15a-b7b0a16ed58b
# ╠═593593d5-0c78-4b03-a7e7-21cd5765d5a7
# ╠═3114c21c-a9e1-4f03-abb1-e2748227e374
# ╠═929cfc77-de23-4d8d-a1d7-93b940b94a62
