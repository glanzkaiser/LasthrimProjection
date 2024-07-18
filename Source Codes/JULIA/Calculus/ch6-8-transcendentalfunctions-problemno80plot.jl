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

a, b = -1, 1

f(x) = sin.(asin.(x))
g(x) = asin.(sin(x))

plot(f, a, b; ytick=pitick(a, b, 4; mode=:latex), framestyle=:zerolines,
	linestyle=:solid, linecolor=:blue2,
	legend=:topright, label=L"y = \sin \ (\arcsin(x))", 
	bottom_margin=3mm,
	size=(900, 460), tickfontsize=10)
plot!(g,-2pi,2pi; linestyle=:dash, label=L"y = \arcsin(\sin(x))")