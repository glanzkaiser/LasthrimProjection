using Plots; plotlyjs()

z, Θ = range(0,10,200), range(0,2π,300)

# Trefoil cone:
X = [u/3 * (sin(v) + 2*sin(2v)) for u in z, v in Θ]
Y = [u/3 * (cos(v) - 2*cos(2v)) for u in z, v in Θ]
Z = [-2u for u in z, _ in Θ]
surface(X, Y, Z, size=(600,600), cbar=:none, legend=false)