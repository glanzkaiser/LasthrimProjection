# https://discourse.julialang.org/t/region-bounded-between-sin-x-and-cos-x/101008

using Plots, LaTeXStrings, Plots.PlotMeasures, CalculusWithJulia
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

a, b = -2π, 2π

y(x) = log(x^20)
y2(x) = 20*log(x)
xs1 = range(a, b, length=150)
xs2 = range(0, b, length=150)


plot(xs1, y, color=:red, xtick=pitick(a, b, 4; mode=:latex), 
	xlims=(-2π, 2π), ylims=(-50,50),framestyle=:zerolines,
	linestyle=:solid,  linecolor=:red2,
	legend=:topleft, label=L"y = \ln \ x^{20}", 
	bottom_margin=3mm,
	size=(800, 460), tickfontsize=10)

#plot!(xs2,y2, label=L"y =20 \ \log \ x")

