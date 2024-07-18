using Plots, LaTeXStrings, Plots.PlotMeasures, SymPy
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

f(x) = (5 + sin(x))^4

a, b = 0, 2π

plot(f, a, b; ylims= (0,2000), xtick=pitick(a, b, 1; mode=:latex), framestyle=:zerolines,
	legend=:outerright, label=L" f(x) = 3 + \sin (x^{2}) ", 
	size=(720, 360), tickfontsize=10)

# first integral of f
#=
g = integrate(x -> 3+ sin(x^2))

plot!(g, a, b; ylims= (0,2000), xtick=pitick(a, b, 1; mode=:latex), framestyle=:zerolines,
	legend=:outerright, label=L" g(x) = \int 3 + \sin (x^{2}) \ dx", 
	size=(720, 360), tickfontsize=10)
=#

# To calculate the integral at interval [0,2π]
#=
x = symbols("x")
f1 = integrate(3+ sin(x^2), (x, 0, 2))
f1.evalf()

f2 = g(2pi)-g(0)
f2.evalf()

# brings back as BigFloat, give more decimals than evalf
N(f1)
=#