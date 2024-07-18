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

a, b = -π/2, π/2

f(x) = tan.(x)
xs = range(a, b, length=150)
ys = f.(xs)

plot(ys, xs, color=:red, ytick=pitick(a, b, 2; mode=:latex), 
	xlims=(-3,3), framestyle=:zerolines,
	linestyle=:solid,  linecolor=:red2,
	legend=:topleft, label=L"\tan^{-1} \ x", 
	bottom_margin=3mm,
	size=(800, 400), tickfontsize=10)# the inverse function

h(x) = 1/(1+x^2)
h2(x) = -2x/((1+x^2)^2)
xs1 = range(a, b, length=150)
ys1 = h.(xs1)

# diff(h(x),x)

plot!(h, label=L"D_{x} \tan^{-1} \ x = \frac{1}{1 + x^{2}}", framestyle=:zerolines)
plot!(h2, label=L"D^{2}_{x} \tan^{-1} \ x = \frac{-2x}{(1 + x^{2})^{2}}", framestyle=:zerolines)
