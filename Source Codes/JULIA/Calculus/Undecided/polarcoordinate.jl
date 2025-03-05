# https://en.wikipedia.org/wiki/Polar_coordinate_system
# https://docs.juliahub.com/CalculusWithJulia/AZHbv/0.0.5/differentiable_vector_calculus/polar_coordinates.html
using Plots, LaTeXStrings

a, b = 8, 5
r(theta) = sqrt(2a^2 * (cos(2theta))) 
ts = range(-pi/4, pi/4, length=100)
ts2 = range(3pi/4, 5pi/4, length=100)
rs = r.(ts)
plot(ts, rs, proj=:polar, legend=:outertop, label=L"r^{2} = a^{2} + \cos (2 \theta), \ - \frac{\pi}{4} \ ≤ \ \theta \ ≤ \ \frac{\pi}{4}")
plot!(ts2, rs, proj=:polar, legend=:outertop, label=L"r^{2} = a^{2} + \cos (2 \theta), \ \frac{3\pi}{4} \ ≤ \ \theta \ ≤ \ \frac{5\pi}{4}")