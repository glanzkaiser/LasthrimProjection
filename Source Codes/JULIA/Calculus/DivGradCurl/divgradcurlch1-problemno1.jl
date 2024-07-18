# https://docs.juliahub.com/CalculusWithJulia/AZHbv/0.0.7/differentiable_vector_calculus/vector_fields.html

using CalculusWithJulia
using Plots
F(x,y) = [sqrt(2), sqrt(2)] # (i+j) sqrt(2)
F(x,y) = [y, x] # (iy+jx)
F(x,y) = [x, -y] # (ix-jy)
F(x,y) = [y, 0] # (iy)
F(x,y) = [0, x] # (jx)
F(x,y) = [y, x]/sqrt(x^2+y^2) # (iy+jx)
F(x,y) = [y, x*y] # (iy+jxy)
F(x,y) = [1, y] # (i+jy)

vectorfieldplot(F, xlim=(-5,5), ylim=(-5,5), nx=10, ny=10)