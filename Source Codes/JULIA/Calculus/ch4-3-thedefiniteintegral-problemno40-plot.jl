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

a, b = 0, 4π

f(x) = 1 - cos.(x)

plot(f, a, b; ylims= (0,2.5), xtick=pitick(a, b, 1; mode=:latex), framestyle=:zerolines,
	legend=:outerright, label=L"G(x) = \int_{0}^{x} \sin \ t = 1 - \cos(x)", 
	size=(720, 360), tickfontsize=10)
scatter!([π/2], [f(π/2)], color = "green2", label="inflection point", markersize = 2)
scatter!([3π/2], [f(3π/2)], color = "green2", label="", markersize = 2)
scatter!([5π/2], [f(5π/2)], color = "green2", label="", markersize = 2)
scatter!([7π/2], [f(7π/2)], color = "green2", label="", markersize = 2)