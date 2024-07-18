using Plots
plotlyjs()

# If x, y, z are vectors then it won't generate a surface
# for a parameterized surface x,y,z should be matrices:
# Check for: typeof(X), typeof(Y), typeof(Z)

r = 5
h = 3
m, n =200, 150
u = range(0, 2pi, length=n)
v = range(0, h, length=m)

us = ones(m)*u'
vs = v*ones(n)'
#Surface parameterization
X = r*cos.(us)
Y = r*sin.(us)
Z = vs
Plots.surface(X, Y, Z, size=(600,600), cbar=:none, legend=false)