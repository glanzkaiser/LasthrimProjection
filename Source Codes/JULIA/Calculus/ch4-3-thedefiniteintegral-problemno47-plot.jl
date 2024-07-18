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

# Calculate the integral using SymPy
#x = symbols("x")

#f1(x) = (1/20)*(sin(x))^2
#f2(x) = integrate(f1)               

a, b = 0, 8π

f(x) = 5 + (1/20)*(sin(x))^2
g(x) = 5.025x - 0.025sin.(x)*cos.(x)

plot(f, 4π, b; ylims= (0,6), xtick=pitick(a, b, 1; mode=:latex), framestyle=:zerolines,
	legend=:outerright, label=L"f(x) = 5 + \frac{1}{20} \sin^{2} x", 
	size=(720, 360), tickfontsize=10)
plot!(g, a, b; ylims=(0,6),
    label=L"\int f(x) \ dx = 5.025x - 0.025 \sin(x) \cos(x)", 
    bottom_margin=3mm, left_margin=3mm, framestyle=:zerolines,
    legend=:outertop)
