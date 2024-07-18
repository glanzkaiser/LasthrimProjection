using Plots, Distributions, LaTeXStrings

x = range(-3, 3, length=100)

y = pdf.(Normal(0,1), x)

ix = abs.(x) .< 2
plot(x[ix], y[ix], fillrange = zero(x[ix]), fc=:blues, label = L"P(a ≤ X ≤ b)")
plot!(x, y, grid=false, lc=:black, widen=false, label=L"y=f(x)")