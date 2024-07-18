# https://docs.juliahub.com/CalculusWithJulia/AZHbv/0.0.7/differentiable_vector_calculus/vector_fields.html

using CalculusWithJulia
using Plots

pyplot()
#gr()

X(theta,phi) = sin(phi) * cos(theta)
Y(theta,phi) = sin(phi) * sin(theta)
Z(theta,phi) = cos(phi)

thetas = range(0, stop=pi/2, length=50)
phis   = range(0, stop=pi,   length=50)

xs = [X(theta, phi) for theta in thetas, phi in phis]
ys = [Y(theta, phi) for theta in thetas, phi in phis]
zs = [Z(theta, phi) for theta in thetas, phi in phis]

surface(xs, ys, zs)  ## see note
