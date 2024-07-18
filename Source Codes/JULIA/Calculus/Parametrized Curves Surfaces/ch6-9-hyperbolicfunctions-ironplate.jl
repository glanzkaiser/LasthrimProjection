using Plots;
#gr() 
plotlyjs()

r = 4
m, n = 200, 130
h = 3
z, Θ = range(0,h,m), range(0,2π,n)

# Inverted catenary
X = [r * (37 - 24*cosh(v/24)) for u in z, v in Θ]
Y = [r * sin(v) for v in Θ]
Z = [z for z in z, _ in Θ]
surface(X, Y, Z, size=(600,600), cbar=:none, legend=false)

