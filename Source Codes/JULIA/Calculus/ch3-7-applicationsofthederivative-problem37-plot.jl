using Plots, LaTeXStrings
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

a, b = 0, π/2

f(x) = tan.(x) - cbrt(6.2/8.6)
g(x) = f'(x)
plot(f, a, b; ylims=(0,10), xtick=pitick(a, b, 2; mode=:latex), framestyle=:zerolines,
	legend=:outerright, label=L"L'(\theta) = \tan \ \theta - \sqrt[3]{\frac{6.2}{8.6}}", 
	size=(720, 360), tickfontsize=10)
#plot!(g, a, b;ylims=(0,10), xtick=pitick(a, b, 2; mode=:latex), framestyle=:zerolines,
#	legend=:outerright, label=L"f'(x) = \frac{x^{2} \cos \frac{x}{2} + 4x \sin \frac{x}{2}}{2}", 
#	size=(720, 360), tickfontsize=10)
