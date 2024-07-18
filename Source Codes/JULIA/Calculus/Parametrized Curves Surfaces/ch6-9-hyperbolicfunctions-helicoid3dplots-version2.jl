# https://docs.juliahub.com/CalculusWithJulia/AZHbv/0.0.7/differentiable_vector_calculus/vector_fields.html

using CalculusWithJulia
using Plots

pyplot()

r=3
# sin.(thetas) ->  (50 element vector)

X(theta,u) = r * u * cos(theta)
Y(theta,u) = r * u * sin.(theta)
Z(theta,u) = theta

thetas = range(0, stop=10, length=50)
us   = range(-2pi, stop=2pi,   length=50)

xs = [X(theta, u) for theta in thetas, u in us]
ys = [Y(theta, u) for theta in thetas, u in us]
zs = [Z(theta, u) for theta in thetas, u in us]

surface(xs, ys, zs) 

