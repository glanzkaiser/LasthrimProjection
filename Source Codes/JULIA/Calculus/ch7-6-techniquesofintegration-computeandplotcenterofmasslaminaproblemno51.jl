using Plots, LaTeXStrings, Plots.PlotMeasures
gr()

function pitick(start, stop, denom; mode=:text)
    a = Int(cld(start, π/denom))
    b = Int(fld(stop, π/denom))
    tick = range(a*π/denom, b*π/denom; step=π/denom)
    ticklabel = piticklabel.((a:b) .// denom, Val(mode))
    tick, ticklabel
end

function piticklabel(x::Rational, ::Val{:text})
    iszero(x) && return "0"
    S = x < 0 ? "-" : ""
    n, d = abs(numerator(x)), denominator(x)
    N = n == 1 ? "" : repr(n)
    d == 1 && return S * N * "π"
    S * N * "π/" * repr(d)
end

function piticklabel(x::Rational, ::Val{:latex})
    iszero(x) && return L"0"
    S = x < 0 ? "-" : ""
    n, d = abs(numerator(x)), denominator(x)
    N = n == 1 ? "" : repr(n)
    d == 1 && return L"%$S%$N\pi"
    L"%$S\frac{%$N\pi}{%$d}"
end

using SymPy

x, c = symbols("x c")

f(x) = 8-x
g(x) = c*x

a, b = 0, 8/(c+1)

# To calculate the integral between interval [a,b]
m = integrate(f(x)-g(x), (x, a,b))
My = integrate(x*(f(x)-g(x)), (x, a,b))

x_bar = My/m

println("m = ", m.simplify())
println("M_{y} = ", My.simplify())
println("x_{bar} = ", x_bar.simplify())

c = solve(x_bar~2, c)
println("c = ", c[1])
h(x) = g(x)[1]
println("g(x) = ", h(x))

xs = range(a, b, length=150)

plot(f, color=:green3,
	xlims=(0, 3π), ylims=(0, 3π), framestyle=:zerolines,
	linestyle=:solid,  linecolor=:green4,
	legend=:topright, label=L"f(x) = 8 - x", 
	bottom_margin=3mm,
	size=(1200, 800), tickfontsize=10)

plot!(g(x)[1], color=:blue2, label=L"g(x) = \frac{x}{3}")

a_range = a
b_range = 8/(c[1]+1)
t = collect(range(a_range, b_range, length= 100))

plot!(t, f, fillrange =  h, fillalpha = 0.35, c = 1, 
	label = L"f(x) - g(x) ", legend=:topright)

