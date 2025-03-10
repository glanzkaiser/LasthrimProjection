using Plots, FresnelIntegrals, LaTeXStrings, Plots.PlotMeasures, CalculusWithJulia
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

a, b = -3π, 3π

p1 = plot(fresnels, color=:red, xtick=pitick(-3π, 3π, 1; mode=:latex), 
	xlims=(-3π,3π), ylims=(-π,π),framestyle=:zerolines,
	linestyle=:solid,  linecolor=:blue4,
	legend=:topleft, 
	bottom_margin=3mm,
	size=(800, 460), tickfontsize=10)

D_fresnelsineintegral= sin(pi*(x^2)/2)
# First Derivative plot
p2 = plot(D_fresnelsineintegral,xtick=pitick(-π, π, 1; mode=:latex), 
	color=:green4)

s1 = L"S(x) = \int_{0}^{x} \sin \left( \frac{\pi \ t^{2}}{2} \right) \ dt";
s2 = L"D_{x} S (x) = \sin \left( \frac{\pi \ t^{2}}{2} \right) ";

plot(p1, p2, layout = (1, 2), 
	xaxis = "x", yaxis = "y", label=[s1 s2], 
	legend=:outertop)
