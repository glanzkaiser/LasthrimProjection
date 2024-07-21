# Need SymPy installed with `pip3 install sympy` from terminal for CalculusWithJulia version 0.0.1

using CalculusWithJulia

using Plots

gr()       # better arrows than plotly()
quiver([0],[0], quiver=([1],[2]))

unzip(vs) = Tuple(eltype(first(vs))[xyz[j] for xyz in vs] for j in eachindex(first(vs)))

u = [2, 1]
v = [-2, 1]
w = u + v
p = [1,1]
quiver(unzip([p])..., quiver=unzip([u])) # initial at (1,1) terminal at (3,2)
quiver!(unzip([u+p])..., quiver=unzip([v])) # initial at (3,2) terminal at (1,3)
quiver!(unzip([p])..., quiver=unzip([w])) # initial at (1,1) terminal at (1,3)
