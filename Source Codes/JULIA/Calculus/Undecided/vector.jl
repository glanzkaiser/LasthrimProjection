# Calculus With Julia 53 Vectors and Matrices
# Projection
using Plots, CalculusWithJulia, LinearAlgebra, LaTeXStrings
gr()

p = [0,0]
h = [2,3]
a = [1,0]
h_hat = h/norm(h)
theta = acos(dot(h_hat,a))

plot(legend=false)
arrow!(p, v)
arrow!(p, norm(h) * cos(theta) * a)
arrow!(p, a, linewidth=3)

annotate!([(3,1.5, (L"\vec{v}", 10, :black))])
annotate!([(0.9,4, (L"\vec{w}", 10, :black))])
annotate!([(8.5,10, (L"\vec{v} \cdot \vec{w}", 10, :black))])
