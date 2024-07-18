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

f(x) = (sin(x))^2
g(x) = (cos(x))^2
a, b = -2π, 2π

p1 = plot(f, a, b; ylims= (0,2), xtick=pitick(a, b, 1; mode=:latex), framestyle=:zerolines,
	legend=:topright, label=L" f(x) = \sin^{2} x ", 
	left_margin=5mm, size=(720, 360), tickfontsize=10)
p2 = plot(g, a, b; ylims= (0,2), xtick=pitick(a, b, 1; mode=:latex), framestyle=:zerolines,
	legend=:topright, label=L" f(x) = \cos^{2} x ",
	left_margin=5mm, size=(720, 360), tickfontsize=10)

plot(p1, p2, layout = (2, 1), legend=:outerright,
     xaxis = "x", yaxis = "f(x)")

plot!(f,0,2π, label="", fill=(0, 0.15, :green), subplot=1)
plot!(g,0,2π, label="", fill=(0, 0.15, :green), subplot=2)