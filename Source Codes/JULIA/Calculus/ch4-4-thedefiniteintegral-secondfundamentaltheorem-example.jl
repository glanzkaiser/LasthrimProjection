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

a, b = 0, 1.3π

f(x) = log(6x+10.66)/2 - cos.(3x-3.3)

plot(f, a, b; ylims= (0,4), xtick=false, ytick=false, framestyle=:zerolines,
	legend=:outerright, bottom_margin=5mm, 
	label=L"f(x) = \frac{\log(6x+10.66)}{2} - \cos(3x-3.3)", 
	size=(720, 360), tickfontsize=10)
scatter!([0.2π], [f(0.2π)], color = "green2", label="", markersize = 3)
scatter!([0.35π], [0], color = "green2", label="", markersize = 3)

plot!([0.2π,0.35π],[f(0.2π),0], label="", linecolor=:green, linestyle=:dash)

annotate!([(0.25π,1.3, (L"(1,1)", 10, :black))])
annotate!([(0.41π,0.2, (L"(2,0)", 10, :black))])

scatter!([1.01π], [f(1.01π)], color = "green2", label="", markersize = 3)
scatter!([0.83π], [f(1.01π)], color = "green2", label="", markersize = 3)

plot!([1.01π,0.83π],[f(1.01π),f(1.01π)], label="", linecolor=:green, linestyle=:dash)

annotate!([(0.83π,0.5, (L"(4,1)", 10, :black))])
annotate!([(1.01π,0.5, (L"(5,1)", 10, :black))])