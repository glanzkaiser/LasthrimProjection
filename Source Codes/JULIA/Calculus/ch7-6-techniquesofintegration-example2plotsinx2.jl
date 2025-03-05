using SymPy, Plots, LaTeXStrings, Plots.PlotMeasures
@syms x
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

f = sin(x^2)
#gradient_line(f, x₀) = (x -> f(x₀) + f'(x₀)*(x-x₀))

xs = range(a, b, length=150)
ys = f.(xs)

d = plot(xs, ys, color=:green, xtick=pitick(a, b, 2; mode=:latex), 
	xlims=(0, sqrt(π)), ylims=(0,1.2), framestyle=:zerolines,
	linestyle=:solid,  linecolor=:blue2,
	legend=:topright, label=L"y(x) = \sin \ x^{2}", 
	bottom_margin=3mm,
	size=(1000, 800), tickfontsize=10)# the inverse function
	
plot(d)
#plot!(gradient_line(f, 1.2), 0.8:0.1:1.5, label = "y'(c)", color = 2);

#savefig(d,"plot.png")
# savefig("plot.png")