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

a, b = 0, π

f(x) = sin.(x)
xs = range(a, b, length=150)
ys = f.(xs)

d = plot(xs, ys, color=:red, xtick=pitick(a, b, 4; mode=:latex), ytick=false,
	xlims=(0, π), framestyle=:zerolines,
	linestyle=:solid,  linecolor=:red2,
	legend=:topright, label=L"\sin \ x", 
	bottom_margin=3mm,
	size=(1200, 800), tickfontsize=10)# the inverse function
plot!([0.6], seriestype="hline", color=:green, label="y=k")	
savefig(d,"plot.png")
# savefig("plot.png")