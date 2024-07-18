using CalculusWithJulia, LaTeXStrings # ignore any warnings 
using Plots
gr()

f(x) = sin(x)
a, b = 0, 4pi
c = pi/4
plot(f, a, b, label=L"f(x) = sin \ x")
plot!(tangent(f,c), a, b, label=L"f'(\frac{π}{4})", color=3)
