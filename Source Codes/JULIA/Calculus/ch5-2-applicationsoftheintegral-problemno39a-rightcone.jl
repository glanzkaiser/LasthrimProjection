using Plots; plotlyjs()

z, Θ = range(0,10,200), range(0,2π,300)

# Right-cone:
X = [u * cos(v) for u in z, v in Θ]
Y = [u * sin(v) for u in z, v in Θ]
Z = [-2u for u in z, _ in Θ]
surface(X, Y, Z, size=(600,600), cbar=:none, legend=false)