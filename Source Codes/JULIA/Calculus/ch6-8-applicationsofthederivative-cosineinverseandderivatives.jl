using Plots, LaTeXStrings, SymPy, Plots.PlotMeasures
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

f(x) = cos.(x)
xs = range(a, b, length=150)
ys = f.(xs)

plot(ys, xs, color=:red, ytick=pitick(-π, π, 2; mode=:latex), 
	xlims=(-3,3), ylims=(-π, π), framestyle=:zerolines,
	linestyle=:solid,  linecolor=:red2,
	legend=:topleft, label=L"\cos^{-1} \ x", 
	bottom_margin=3mm,
	size=(800, 400), tickfontsize=10)# the inverse function

h(x) = -1/(sqrt(1 - x^2))
xs1 = range(-1, 1, length=150)
ys1 = h.(xs1)

h2(x) = -x/(sqrt((1-x^2)^3)) # diff(h(x),x)
xs2 = range(-1, 1, length=150)
ys2 = h2.(xs2)

plot!(xs1, ys1, label=L"D_{x} \cos^{-1} \ x = - \frac{1}{\sqrt{1 - x^{2}}}", framestyle=:zerolines)

plot!(xs2, ys2, label=L"D^{2}_{x} \cos^{-1} \ x = - \frac{x}{\sqrt{(1-x^{2})^{3}}}", framestyle=:zerolines)
