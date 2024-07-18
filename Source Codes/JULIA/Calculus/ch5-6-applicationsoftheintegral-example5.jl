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

f(x) = sin(x)

a, b = 0, π

plot(f, a, b; ylims= (0,1.2), xtick=pitick(a, b, 2; mode=:latex), framestyle=:zerolines,
	legend=:outerright, label=L" f(x) =\sin (x) ", 
	size=(720, 360), tickfontsize=10)

plot!([0.5,0.5],[0,f(0.5)], label="", linecolor=:green)
plot!([0.7,0.7],[0,f(0.7)], label="", linecolor=:green)

plot!(f,0.5,0.7, label="", fill=(0, 0.15, :blue))

scatter!([(1.2)/2],[(f(0.6))/2], color="blue1", label="", markersize=3)

annotate!([(0.55,0.63, (L"△x", 10, :black))])