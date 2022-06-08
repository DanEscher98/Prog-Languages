### A Pluto.jl notebook ###
# v0.14.5

using Markdown
using InteractiveUtils

# ╔═╡ 71d3f562-b60a-11eb-097c-b932a691c3aa
begin
	using Pkg
	Pkg.activate(".")
	using FunMath, Latexify, TikzPictures
end

# ╔═╡ 9468ad49-b719-432f-979b-27a3fc43e5ff
md"
### Sum the inner lattice

- First: Represent a circle by $2\pi$. Then, if a polygon has $n$ vertices the angle between two of them will be $\frac{2\pi}{n}$.

- Second: 


$$\begin{align}
\theta &= \frac{\pi}{n}\\

r &= \begin{cases}
		1 & \text{The \textbf{radius} is set to 1}\\
		\frac{\csc(\theta)}{2} & \text{The \textbf{sides} are set to 1}
\end{cases}\\

f(n) &= n\sum_{i=1}^{\lfloor n/2\rfloor} 2r\sin(\theta i) - \Big(\frac{nr}{2}\Big)
\begin{cases}
		0 & \text{n is odd}\\
		1 & \text{n is even}
\end{cases}
\end{align}$$
"

# ╔═╡ 01e6adc2-5901-4ec4-8ed5-960d32746966
TikzPicture(L"""
	\draw (0,0) circle (1);
	\def \num {15}
	\def \mxi {7}
	\foreach \n in {1,...,\num}
		\foreach \i in {1,...,\mxi}
			\draw ({(\n-1) * (360/\num)}:1) -- 
			({(\i + \n - 1)* (360/\num)}:1);
""", options="scale=5")

# ╔═╡ b1f0d50a-bcf3-4d4e-84e4-e8b2f1328e82
TikzPicture(L"""
\draw[->] (-.5,0) -- (3,0) node[right](xline) {x};
\draw[->] (0,-.5) -- (0,3) node[right](yline) {y};
\draw[red] (xline) -- (yline);
""")

# ╔═╡ ca28e0c4-f382-4524-93f4-205c852d70b3
sumInnerLattice(30)

# ╔═╡ 49385def-e078-4cc7-8f88-45a2389e2434
TikzPicture(L"""
	\def\r{6}
	\def\n{20}
	\def\m{200}
	\draw (0,0) circle (\r);
	\foreach \k in {1,...,\m}{
		\draw ({\r*cos((-pi*2*\k/\m + pi/2) r)},
		{\r*sin((-pi*2*\k/\m + pi/2) r)}) -- 
		({\r*cos((-pi*2*Mod(\k*\n,\m)/\m + pi/2) r)},
		{\r*sin((-pi*2*Mod(\k*\n,\m)/\m + pi/2) r)});}
""", options="scale=1")

# ╔═╡ Cell order:
# ╠═71d3f562-b60a-11eb-097c-b932a691c3aa
# ╟─9468ad49-b719-432f-979b-27a3fc43e5ff
# ╠═01e6adc2-5901-4ec4-8ed5-960d32746966
# ╠═b1f0d50a-bcf3-4d4e-84e4-e8b2f1328e82
# ╠═ca28e0c4-f382-4524-93f4-205c852d70b3
# ╠═49385def-e078-4cc7-8f88-45a2389e2434
