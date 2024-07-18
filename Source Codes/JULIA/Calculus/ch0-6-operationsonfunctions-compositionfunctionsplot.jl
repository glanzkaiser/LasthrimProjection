# https://jverzani.github.io/CalculusWithJuliaNotes.jl/precalc/transformations.html
using CalculusWithJulia
using Plots

f(x) = x^2
g(x) = sin(x)
fg = f ∘ g      # typed as f \circ[tab] g
gf = g ∘ f      # typed as g \circ[tab] f
plot(fg, -2, 2, label="f∘g")
plot!(gf, label="g∘f")