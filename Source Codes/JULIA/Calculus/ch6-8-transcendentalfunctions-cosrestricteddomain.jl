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

a, b = -π, 2π
a1, b1 = -π, 0
a2, b2 = 0, π
a3, b3 = π, 2π

f(x) = cos.(x)

plot(f, a1, b1; xtick=pitick(a, b, 2; mode=:latex), framestyle=:zerolines,
	linestyle=:dot,  linecolor=:blue2,
	legend=:outerright, label=L"f(x) = \cos \ x", 
	bottom_margin=6mm,
	size=(800, 400), tickfontsize=10)
plot!(f, a2, b2; xtick=pitick(a, b, 2; mode=:latex), framestyle=:zerolines,
	linestyle=:solid, linecolor=:blue2,
	legend=:outerright, label="Restricted domain")
plot!(f, a3, b3; xtick=pitick(a, b, 2; mode=:latex), framestyle=:zerolines,
	linestyle=:dot,  linecolor=:blue2,
	legend=:outerright, label="")